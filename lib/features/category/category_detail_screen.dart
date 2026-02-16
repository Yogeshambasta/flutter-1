// import 'package:flutter/material.dart';
// import '../../../core/ads/interstitial_ad_service.dart';
//
// class CategoryDetailScreen extends StatefulWidget {
//   final String title;
//   final String description;
//
//   const CategoryDetailScreen({
//     super.key,
//     required this.title,
//     required this.description,
//   });
//
//   @override
//   State<CategoryDetailScreen> createState() =>
//       _CategoryDetailScreenState();
// }
//
// class _CategoryDetailScreenState
//     extends State<CategoryDetailScreen> {
//
//   final InterstitialAdService _adService =
//   InterstitialAdService();
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await _adService.loadAd();
//       _adService.showAd();
//     });
//   }
//
//   void _goBackWithData() {
//     Navigator.pop(context, "User visited ${widget.title}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(widget.description),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _goBackWithData,
//             child: const Text("Go Back with Data"),
//           )
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../../../core/ads/interstitial_ad_service.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String title;
  final String description;

  const CategoryDetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<CategoryDetailScreen> createState() =>
      _CategoryDetailScreenState();
}

class _CategoryDetailScreenState
    extends State<CategoryDetailScreen> {

  final InterstitialAdService _adService =
  InterstitialAdService();

  bool _isAdShown = false;

  @override
  void initState() {
    super.initState();

    /// Show interstitial after screen builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInterstitial();
    });
  }

  void _showInterstitial() {
    if (_isAdShown) return;

    _adService.showAd(
      onAdClosed: () {
        // Ad closed → user sees content
        debugPrint("Interstitial Ad Closed");
      },
    );

    _isAdShown = true;
  }

  void _goBackWithData() {
    Navigator.pop(context, "User visited ${widget.title}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goBackWithData,
              child: const Text("Go Back with Data"),
            )
          ],
        ),
      ),
    );
  }
}
