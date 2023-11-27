import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../modules/main/components/ads/ad_helper.dart';

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  NativeAd? nativeAd;
  bool nativeAdIsLoaded = false;
  @override
  void initState() {
    isShowAdsNative();
    super.initState();
  }

  void isShowAdsNative() {
    nativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          print('$NativeAd loaded.');
          setState(() {
            nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$NativeAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$NativeAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$NativeAd onAdClosed.'),
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: Colors.white12,
        callToActionTextStyle: NativeTemplateTextStyle(
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.black38,
          backgroundColor: Colors.white70,
        ),
      ),
    )..load();
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AdWidget adWidget = AdWidget(key: UniqueKey(), ad: nativeAd!);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        nativeAdIsLoaded
            ? Container(
                height: 300,
                child: adWidget,
              )
            : SizedBox.shrink(),
        GestureDetector(
          onTap: () {
            SystemNavigator.pop();
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Press to exit app',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
