import UIKit
import Flutter
import GoogleMaps
import image_picker_ios

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCZCt0gjDjVjCgVY3bnigpXb7oyY_tEXkY")
        GeneratedPluginRegistrant.register(with: self)
        
        // Register the image_picker plugin
        let registry = ImagePickerPluginRegistry(registry: self)
        ImagePickerIOS.register(with: registry.registrar(forPlugin: "ImagePickerPlugin"))
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}