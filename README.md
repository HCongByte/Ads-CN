# Ads-CN（Swift Package Manager 版）

字节跳动 [Bytedance-UnionAD](https://github.com/bytedance/Bytedance-UnionAD) iOS SDK（穿山甲 / Pangle）的
Swift Package Manager 封装。二进制版本 **7.8.1.3**，由原 `Ads-CN.podspec` 改造而来。

---

## 1. 目录结构

```
Package.swift                          SPM 清单（等价于 Ads-CN.podspec）
SDK/                                   二进制载荷（由 Scripts/fetch-sdk.sh 拉取，约 512 MB）
  BUAdSDK.xcframework                  arm64 + arm64/x86_64-simulator，静态库，模块名 BUAdSDK
  CSJMediation.xcframework             静态库，无头文件 / 无 modulemap（仅链接）
  BUAdLive.xcframework                 静态库，模块名 BUAdLive
  BUAdTestMeasurement.xcframework      静态库，调试用
Sources/
  AdsCN/                               product "Ads-CN"                 （+ CSJAdSDK.bundle）
  AdsCNLive/                           product "Ads-CN-Live"
  AdsCNMediation/                      product "Ads-CN-Mediation"
  AdsCNTestMeasurement/                product "Ads-CN-TestMeasurement" （+ BUAdTestMeasurement.bundle）
Scripts/fetch-sdk.sh                   下载并校验 SDK.zip（SHA-256 内置）
```


## 2. Podspec → SPM 映射

| 原 podspec | 本包 product | 说明 |
|---|---|---|
| `Ads-CN/BUAdSDK` | **`Ads-CN`** | BUAdSDK.xcframework + CSJAdSDK.bundle |
| `Ads-CN/BUAdLive` / `BUAdLive-Framework` | **`Ads-CN-Live`** | 需额外补 LivePull-Lite，见 §4 |
| `Ads-CN/CSJMediation` / `CSJMediation-Only` | **`Ads-CN-Mediation`** | CSJMediation 无头文件，只能链接不能 import |
| `Ads-CN/BUAdTestMeasurement` | **`Ads-CN-TestMeasurement`** | 仅调试，勿随包发布 |

> 原 podspec 的 `default_subspec` 是 `BUAdSDK + BUAdLive-Framework`。由于 `BUAdLive` 依赖
> `BUTTSDKFramework/LivePull-Lite`（不在本仓库内，SPM 无法表达 CocoaPods 依赖），这里把 `Ads-CN`
> 定位为自包含的 BUAdSDK（已完成静态链接验证），Live 单独做成 product，避免默认安装即链接失败。

## 3. 接入方式

Xcode → `File ▸ Add Package Dependencies…`

- 本地：`Add Local…` 选择本仓库根目录；
- 远程：填入本仓库 URL（注意 `SDK/` 是否已提交，见 §6）。

依赖 Product 选择 `Ads-CN`（需要直播 / 聚合再选对应的 `Ads-CN-Live` / `Ads-CN-Mediation`）。

```objc
#import <BUAdSDK/BUAdSDK.h>   // 或 Swift: import AdsCN

[BUAdSDKManager startWithAsyncCompletionHandler:^(BOOL success, NSError *error) {
    // ...
}];
```

### 3.1 必须在 App target 设置的项

| 设置 | 值 | 原因 |
|---|---|---|
| `OTHER_LDFLAGS` | `$(inherited) -ObjC` | 原 podspec 的 `pod_target_xcconfig` 就是 `-ObjC`。SDK 大量使用 ObjC category / `+load` 注册，缺了会导致类与分类不加载。SPM 在不使用 `unsafeFlags` 的前提下无法表达该 flag（用了会禁止他人以远程依赖方式引用本包），因此放在 App target。 |
| `-weak_framework`（可选） | `AppTrackingTransparency`、`CoreHaptics` | SDK 最低系统为 iOS 11，这两个框架分别在 iOS 14 / 13 才存在。ld64 会自动弱链接；若工程在 iOS 12 及以下启动崩溃，再显式加弱链接。 |

### 3.2 资源 bundle（重要）

`CSJAdSDK.bundle` 已以 `.copy` 方式挂在 `AdsCN` 资源里，SPM 会把它放进
`<App>.app/Ads-CN_AdsCN.bundle/CSJAdSDK.bundle`（即 bundle 内嵌套一层）。

SDK 运行时通过 `mainBundle` 的 `resourcePath` 查找 `CSJAdSDK.bundle`（二进制里是
`stringWithFormat:` + `pathForResource:ofType:` 的实现），因此**若广告 UI 出现缺图 / 缺 logo / 按钮异常**，
在 App target 的 *Build Phases ▸ Copy Bundle Resources* 里把
`Sources/AdsCN/Resources/CSJAdSDK.bundle` 再添加一次（直接落到 `.app` 根目录）即可。
`Ads-CN-TestMeasurement` 的 `BUAdTestMeasurement.bundle` 同理。

## 4. LivePull-Lite（仅 `Ads-CN-Live` / `Ads-CN-Mediation` 需要）

`BUAdLive` 的静态库引用了 `TVLSettingsManager`、`TVLMediaFormatTypeFLV` 等符号，由
`BUTTSDKFramework/LivePull-Lite (1.48.2.3-premium)` 提供。该组件不在本仓库、也未提供 SPM 制品，两种补法：

1. 工程里继续用 CocoaPods 只装这一个 pod：`pod 'BUTTSDKFramework/LivePull-Lite', '1.48.2.3-premium'`；
2. 拿到其 xcframework 后，在 `Package.swift` 里加一个 binaryTarget：

```swift
.binaryTarget(name: "LivePull", path: "SDK/LivePull.xcframework"),
// 并把 AdsCNLive 的依赖改成 ["AdsCN", "BUAdLive", "LivePull"]
```

## 5. 版本与二进制一致性

`SDK/` 内的二进制与 `Ads-CN.podspec` 的 `s.source`（7.8.1.3）一一对应。升级步骤：

1. 修改 `Scripts/fetch-sdk.sh` 里的 `SDK_VERSION` / `SDK_URL` 与 `SDK_SHA256`；
2. 执行 `Scripts/fetch-sdk.sh --force`；
3. 更新 `Sources/AdsCN/AdsCN.swift` 中的 `AdsCN.version` 与 `Package.swift` 注释里的版本号。

## 6. 仓库体积（约 512 MB）

`BUAdSDK.xcframework` 单体约 448 MB（含调试符号）。建议二选一：

- **不提交二进制**：`.gitignore` 增加 `SDK/*.xcframework` 与 `Sources/*/Resources/*.bundle`，
  clone 后先跑 `Scripts/fetch-sdk.sh`；
- **提交二进制**：用 Git LFS 跟踪 `SDK/**`，否则仓库会迅速膨胀。

## 7. 许可

SDK 许可见 `SDK/LICENSE`（MIT，Copyright (c) 2018 Bytedance Inc.）；本封装沿用同一许可。
