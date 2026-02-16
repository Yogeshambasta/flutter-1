// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:flutter/foundation.dart';
//
// class InterstitialAdService {
//   InterstitialAd? _interstitialAd;
//
//   String get _adUnitId {
//     if (kReleaseMode) {
//       return "YOUR_REAL_INTERSTITIAL_ID";
//     } else {
//       return "ca-app-pub-3940256099942544/1033173712";
//     }
//   }
//
//   Future<void> loadAd() async {
//     await InterstitialAd.load(
//       adUnitId: _adUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           _interstitialAd = ad;
//         },
//         onAdFailedToLoad: (error) {
//           _interstitialAd = null;
//         },
//       ),
//     );
//   }
//
//   void showAd() {
//     if (_interstitialAd != null) {
//       _interstitialAd!.show();
//       _interstitialAd = null;
//     }
//   }
// }



import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart';

class InterstitialAdService {
  InterstitialAd? _interstitialAd;

  String get _adUnitId {
    if (kReleaseMode) {
      return "YOUR_REAL_INTERSTITIAL_ID";
    } else {
      return "ca-app-pub-3940256099942544/1033173712";
    }
  }

  void showAd({
    required VoidCallback onAdClosed,
  }) {
    InterstitialAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;

          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  onAdClosed();
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                  onAdClosed();
                },
              );

          _interstitialAd!.show();
        },
        onAdFailedToLoad: (error) {
          onAdClosed(); // If ad fails → still open page
        },
      ),
    );
  }
}
