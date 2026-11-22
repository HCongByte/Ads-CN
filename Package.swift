// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ads-CN",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Ads-CN",
            targets: ["Ads-CN"]
        ),
        .library(name: "Live", targets: ["BUAdLive", "BUTTSDK"]),
        .library(name: "Mediation", targets: ["Ads-CN", "CSJMediation"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "BUAdSDK", url: "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/BUAdSDK/7.9.0.4/BUAdSDK.zip", checksum: "3dba8fc0512947759273461f06f8ce0a8e20197f6dede2580e0dceb42562c397"),
        .binaryTarget(name: "BUAdLive", url: "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/BUAdLive/7.9.0.4/BUAdLive.zip", checksum: "5f5d68a67a929bb9b5f335fc18610b5307a094de5ce448133e2918460211a2a8"),
        .binaryTarget(name: "CSJMediation", url: "https://sf3-fe-tos.pglstatp-toutiao.com/obj/csj-sdk-static/Public/CSJMediation/7.9.0.4/CSJMediation.zip", checksum: "1db5ba9447149c8e248085ae5ca897c8ad57edcacbff953b1d93bf7749a6fb73"),
        .binaryTarget(name: "LivePullLite", url: "https://lf3-static.bytednsdoc.com/obj/eden-cn/nuvjbvo/csj_ad_sdk_static/BUTTSDK/VolcBaseLog.xcframework.zip", checksum: "0112b86dbde1295e6c639409e973a9843e36a9683c4923d12b7904ad533cf899"),
        .binaryTarget(name: "TTFFmpeg", url: "https://lf3-static.bytednsdoc.com/obj/eden-cn/nuvjbvo/csj_ad_sdk_static/BUTTSDK/TTFFmpeg.xcframework.zip", checksum: "38dff0191d12717e065bf73af9eaa412fa7b4e9893b4b23cf8a39064477d0d55"),
        .binaryTarget(name: "VolcBaseLog", url: "https://lf3-static.bytednsdoc.com/obj/eden-cn/nuvjbvo/csj_ad_sdk_static/BUTTSDK/VolcBaseLog.xcframework.zip", checksum: "5474ecb9b126e033075356a1fb01d215b647f503d1eba3d64bcd59c8508be984"),
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
        .testTarget(
            name: "Ads-CNTests",
            dependencies: ["Ads-CN"]
        ),
    ]
)
