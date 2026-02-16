import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AdMobUtil {

  /// Initialize AdMob SDK
  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  /// Google Official Test Banner Ad Unit ID (Android)
  static String get bannerAdUnitId {
    return "ca-app-pub-3940256099942544/6300978111";
  }

  ///  Single AdRequest instance
  static const AdRequest _adRequest = AdRequest();

  /// Create Banner Ad
  static BannerAd createBannerAd({
    required VoidCallback onAdLoaded,
    required Function(LoadAdError) onAdFailed,
  }) {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: _adRequest,
      listener: BannerAdListener(
        onAdLoaded: (_) => onAdLoaded(),
        onAdFailedToLoad: (_, error) => onAdFailed(error),
      ),
    );
  }
}
