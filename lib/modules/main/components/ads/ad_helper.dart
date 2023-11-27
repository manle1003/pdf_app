import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  static bool checkRemoveAds = false;

  // ADS Banner
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else {
        return 'ca-app-pub-6079237607801166/3617800518';
      }
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else {
        return 'ca-app-pub-6079237607801166/7598252010';
      }
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  // ADS Full
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/1033173712';
      } else {
        return 'ca-app-pub-6079237607801166/2967063823';
      }
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/4411468910';
      } else {
        return 'ca-app-pub-6079237607801166/1010708651';
      }
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  // ADS Reward
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/5224354917';
      } else {
        return 'ca-app-pub-6079237607801166/1350729826';
      }
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/1712485313';
      } else {
        return 'ca-app-pub-6079237607801166/6127303963';
      }
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  // ADS Native
  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/2247696110';
      } else {
        return 'ca-app-pub-6079237607801166/6320023465';
      }
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/1712485313';
      } else {
        return 'ca-app-pub-6079237607801166/2188058954';
      }
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  // ADS Open App
  static String get openAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return 'ca-app-pub-3940256099942544/3419835294';
      } else {
        return 'ca-app-pub-6079237607801166/2935312220';
      }
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return 'ca-app-pub-6297423778563938/4170065941';
      } else {
        return 'ca-app-pub-6079237607801166/7737852814';
      }
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
