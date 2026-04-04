import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    private var methodChannel: FlutterMethodChannel?
    private var pendingDeepLink: String?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        let controller = window?.rootViewController as! FlutterViewController

        // ✅ Save channel as property — used for both cold & warm start
        methodChannel = FlutterMethodChannel(
            name: "com.example.movie_app/deep_link",
            binaryMessenger: controller.binaryMessenger
        )

        methodChannel?.setMethodCallHandler { [weak self] call, result in
            if call.method == "getInitialLink" {
                // Cold start — الـ app كان مقفول
                result(self?.pendingDeepLink)
                self?.pendingDeepLink = nil
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // Warm start — الـ app كان شغال
    override func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        guard url.scheme == "movieapptask" else { return false }

        // ✅ invokeMethod directly — don't store in pendingDeepLink
        methodChannel?.invokeMethod("onDeepLink", arguments: url.absoluteString)
        return true
    }
}