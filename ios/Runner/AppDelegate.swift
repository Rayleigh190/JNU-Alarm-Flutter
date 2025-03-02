import Flutter
import UIKit

import google_mobile_ads

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
    // Native Admob Start
    let noticeAdFactory = NoticeNativeAdFactory()
    FLTGoogleMobileAdsPlugin.registerNativeAdFactory(self, factoryId:"NoticeNativeAd",nativeAdFactory:noticeAdFactory)
    // Native Admob End
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
