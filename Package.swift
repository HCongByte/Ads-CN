// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mainURL = "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public"

let ttsdkURL = "https://lf3-static.bytednsdoc.com/obj/eden-cn/nuvjbvo/csj_ad_sdk_static"

let package = Package(
    name: "Ads-CN",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Ads-CN",
            targets: ["Ads-CN", "CSJMediation"]
        ),
        .library(
            name: "Live",
            targets: ["BUAdLive", "BUTTSDK"]
        ),
        .library(
            name: "Live-Framework",
            targets: ["BUAdLive", "BUTTSDKFramework"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "BUAdSDK",
            url: "\(mainURL)/BUAdSDK/7.9.0.4/BUAdSDK.zip",
            checksum: "3dba8fc0512947759273461f06f8ce0a8e20197f6dede2580e0dceb42562c397"
        ),
        .binaryTarget(
            name: "BUAdLive",
            url: "\(mainURL)/BUAdLive/7.9.0.4/BUAdLive.zip",
            checksum:
                "5f5d68a67a929bb9b5f335fc18610b5307a094de5ce448133e2918460211a2a8"
        ),
        .binaryTarget(
            name: "CSJMediation",
            url: "\(mainURL)/CSJMediation/7.9.0.4/CSJMediation.zip",
            checksum: "1db5ba9447149c8e248085ae5ca897c8ad57edcacbff953b1d93bf7749a6fb73"
        ),
        .binaryTarget(
            name: "LivePullLite",
            url:
                "\(ttsdkURL)/BUTTSDK/1.48.2.4/LivePullLite.xcframework.zip", checksum: "208384fec731df21c3c5fada2cd3ddba1f17821c1c11156174c4fd70301b62ac"
        ),
        .binaryTarget(
            name: "TTFFmpeg",
            url: "\(ttsdkURL)/BUTTSDK/TTFFmpeg.xcframework.zip",
            checksum: "38dff0191d12717e065bf73af9eaa412fa7b4e9893b4b23cf8a39064477d0d55"
        ),
        .binaryTarget(
            name: "VolcBaseLog",
            url: "\(ttsdkURL)/BUTTSDK/VolcBaseLog.xcframework.zip",
            checksum: "5474ecb9b126e033075356a1fb01d215b647f503d1eba3d64bcd59c8508be984"
        ),
        .binaryTarget(
            name: "TTSDKCore",
            url: "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKCore.xcframework.zip",
            checksum: "8132244efc08c24f1246d4323f3c038bc166738e3f4f125202170224a0828b5a"
        ),
        .binaryTarget(
            name: "TTSDKLiveBase",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKLiveBase.xcframework.zip", 
            checksum: "5b33ebb65246ec4ca9431029b83cdbe3f78b9ef339a1a2d330293e5f4e1214ed"
        ),
        .binaryTarget(
            name: "TTSDKLivePlayerLite",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKLivePlayerLite.xcframework.zip",
            checksum: "5a8eeed98ea52a87845c5f52c4f7e3b8279a11cf994a0796f7b3ea522f918ed2"
        ),
        .binaryTarget(
            name: "TTSDKLivePullVolcLog",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKLivePullVolcLog.xcframework.zip",
            checksum: "b8518156d304ea555537b93eb23cecbc1f095954713fc77dacd0d108132058dc"
        ),
        .binaryTarget(
            name: "TTSDKPlayerCoreLiveLite",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKPlayerCoreLiveLite.xcframework.zip",
            checksum: "fb17e01f003b5746c17d8b7dfe3dcb7a8bd3cec9180a1b04a3326d6ea5a0cd69"
        ),
        .binaryTarget(
            name: "TTSDKReachability",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKReachability.xcframework.zip",
            checksum: "8c14d7d6818bac708ab5a6fdd5c48e36abcc48a91d51441039e4016fb952022f"
        ),
        .binaryTarget(
            name: "TTSDKStrategyLite",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKStrategyLite.xcframework.zip",
            checksum: "6f743e3c1b5937ddd5dfdbcdde582fb6d051b32aca4a8620e349534bfeb1cde4"
        ),
        .binaryTarget(
            name: "TTFFmpeg-Framework",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTFFmpeg.xcframework.zip",
            checksum: "0e8719f9c88f2c7b78ece2eb84b9400053b8735d97a304c0a4f6016cba2ded12"
        ),
        .binaryTarget(
            name: "TTSDKTTFFmpegLiveLite",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKTTFFmpegLiveLite.xcframework.zip",
            checksum: "6d6da337d2dd18c5fb810defed07c2300e93a950942fce786ee66105e35da3fb"
        ),
        .binaryTarget(
            name: "TTSDKVolcLog",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/TTSDKVolcLog.xcframework.zip",
            checksum: "18e53274d85a1e3dd76e5b0be61f32f398aa1b03bb814923a668d5d85103b379"
        ),
        .binaryTarget(
            name: "VolcBaseLog-Framework",
            url:
                "\(ttsdkURL)/BUTTSDKFramework/1.48.2.3-premium/VolcBaseLog.xcframework.zip",
            checksum: "4bc1df6aa8084caeb323a75d23a886eeeba2081a1b24525114b80890e1b0ebbd"
        ),
        
        
        .target(
            name: "Ads-CN",
            dependencies: ["BUAdSDK"],
            resources: [.copy("CSJAdSDK.bundle")],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("MapKit"),
                .linkedFramework("WebKit"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("AdSupport"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("Accelerate" ),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("JavaScriptCore"),
                .linkedFramework("Security"),
                .linkedFramework("CoreImage"),
                .linkedFramework("ImageIO"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreText"),
                .linkedFramework("SpriteKit"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("DeviceCheck"),
                .linkedFramework("CoreML"),
                .linkedFramework("CoreHaptics"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv"),
                .linkedLibrary("z"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("bz2"),
                .linkedLibrary("xml2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("c++abi"),
            ]
        ),
        .target(
            name: "BUTTSDK",
            dependencies: ["LivePullLite", "TTFFmpeg", "VolcBaseLog"],
            linkerSettings: [
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalKit"),
                .linkedFramework("OpenAL"),
                .linkedFramework("VideoToolBox"),
                .linkedFramework("AudioToolBox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("MetricKit"),
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("stdc++"),
                .linkedLibrary("z"),
                .linkedLibrary("xml2")
            ]
        ),
        .target(
            name: "BUTTSDKFramework",
            dependencies: [
                "TTSDKCore",
                "TTSDKLiveBase",
                "TTSDKLivePlayerLite",
                "TTSDKLivePullVolcLog",
                "TTSDKPlayerCoreLiveLite",
                "TTSDKReachability",
                "TTSDKStrategyLite",
                "TTFFmpeg-Framework",
                "TTSDKTTFFmpegLiveLite",
                "TTSDKVolcLog",
                "VolcBaseLog-Framework"
            ],
            resources: [
                .copy("VeLive.bundle"),
                .copy("ttplayer.metallib")
            ],
            linkerSettings: [
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalKit"),
                .linkedFramework("OpenAL"),
                .linkedFramework("VideoToolBox"),
                .linkedFramework("AudioToolBox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("MetricKit"),
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("stdc++"),
                .linkedLibrary("z"),
                .linkedLibrary("xml2")
            ]
        ),
        .testTarget(
            name: "Ads-CNTests",
            dependencies: ["Ads-CN"]
        ),
    ]
)
