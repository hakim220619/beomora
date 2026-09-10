import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Kanal kecil "beomora/device": RAM total dan ruang kosong, untuk cek
    // sebelum mengunduh model tulisan tangan
    // (lihat lib/services/device_info_service.dart).
    if let controller = window?.rootViewController as? FlutterViewController {
      let channel = FlutterMethodChannel(
        name: "beomora/device", binaryMessenger: controller.binaryMessenger)
      channel.setMethodCallHandler { call, result in
        guard call.method == "getResources" else {
          result(FlutterMethodNotImplemented)
          return
        }
        var free: Int64 = 0
        if let attrs = try? FileManager.default.attributesOfFileSystem(
          forPath: NSHomeDirectory()),
          let size = attrs[.systemFreeSize] as? NSNumber
        {
          free = size.int64Value
        }
        result([
          "totalRamBytes": Int64(ProcessInfo.processInfo.physicalMemory),
          "availableRamBytes": NSNull(),
          "freeStorageBytes": free,
        ])
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
