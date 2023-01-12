import 'dart:async';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:love_test_app/model/ad_setting.dart';
import 'package:love_test_app/services/ad_id_manager.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class AdManager {
  static const IAdIdManager adIdManager = AdIdManager();

  // Singleton instance code
  static final AdManager _instance = AdManager._();

  static AdManager get instance => _instance;

  AdManager._();

  StreamSubscription? _streamSubscription;

  Future<void> initialize() async {
    AdSetting.fetch();

    const targetingInfo =
        AdRequest(nonPersonalizedAds: true, keywords: <String>[
      'wifi scanner',
      'wifi analyzer',
    ]);

    final requestConf = RequestConfiguration(
      testDeviceIds: [
        '75FD9557226308357210C0CBE80AEBFD', // adeel bhai tablet
        'F11A4F2CCD0BB447FC573BF58881166E', // adeel bhai oppo phone
        '12C7EC57A67C1E1DA69AB81FACB3CA86', // zahid nokia 6.1
        '00008030-00163022226A802E',
        'D98E1FB86FB8EBF408A004D4DCC84F17', // abdullah j7 max
        '75792c0b6f3fb93524bfab6baf9f9d58', // hanzla's iPhone
        '072D2F3992EF5B4493042ADC632CE39F', // Mi Phone
        '0CAE94DF62B6C62D8EA6D89448803B48', // Abd Phone
        '5C1BA2DBF40FBD73DB5FC68755C6885E', // Ahmad's Poco X3
        'A543B873E07FDDB9E706D31E47DDCA6B', // Huawai Adeel Bhai
      ],
      maxAdContentRating: MaxAdContentRating.pg,
    );
    await EasyAds.instance.initialize(
      adIdManager,
      admobConfiguration: requestConf,
      adMobAdRequest: targetingInfo,
      fbTestingId: 'a56ec8ce-cb14-4ec3-8a92-7bde5da4f160',
    );
  }

  Widget showPriorityBanner() {
    final list = AdSetting.singleton.adPriorityList;
    if (list == null || list.isEmpty) {
      return const EasyBannerAd(
          adNetwork: AdNetwork.appLovin, adSize: AdSize.banner);
    }

    for (int i = 0; i < list.length; i++) {
      if (list[i] == AdPriority.appLovin) {
        return const EasyBannerAd(
            adNetwork: AdNetwork.appLovin, adSize: AdSize.banner);
      } else if (list[i] == AdPriority.facebook) {
        return const EasyBannerAd(
            adNetwork: AdNetwork.facebook, adSize: AdSize.banner);
      } else if (list[i] == AdPriority.admob) {
        return const EasyBannerAd(
            adNetwork: AdNetwork.admob, adSize: AdSize.banner);
      } else if (list[i] == AdPriority.unity) {
        return const EasyBannerAd(
            adNetwork: AdNetwork.unity, adSize: AdSize.banner);
      }
    }
    return const EasyBannerAd(
        adNetwork: AdNetwork.appLovin, adSize: AdSize.banner);
  }

  bool showPriorityInterstitial() {
    final list = AdSetting.singleton.adPriorityList;
    if (list == null || list.isEmpty) {
      return EasyAds.instance.showAd(AdUnitType.interstitial);
    }

    for (int i = 0; i < list.length; i++) {
      if (list[i] == AdPriority.facebook) {
        if (EasyAds.instance.showAd(AdUnitType.interstitial,
            adNetwork: AdNetwork.facebook)) return true;
      } else if (list[i] == AdPriority.admob) {
        if (EasyAds.instance.showAd(AdUnitType.interstitial,
            adNetwork: AdNetwork.admob)) return true;
      } else if (list[i] == AdPriority.unity) {
        if (EasyAds.instance.showAd(AdUnitType.interstitial,
            adNetwork: AdNetwork.unity)) return true;
      } else if (list[i] == AdPriority.appLovin) {
        if (EasyAds.instance.showAd(AdUnitType.interstitial,
            adNetwork: AdNetwork.appLovin)) return true;
      }
    }

    return EasyAds.instance.showAd(AdUnitType.interstitial);
  }

  bool showInterstitial({Function? onInterstitialClosed}) {
    if (showPriorityInterstitial()) {
      _streamSubscription?.cancel();
      _streamSubscription = EasyAds.instance.onEvent.listen((event) {
        if (event.adUnitType == AdUnitType.interstitial &&
            event.type == AdEventType.adDismissed) {
          _streamSubscription?.cancel();
          onInterstitialClosed?.call();
        }
      });
      return true;
    } else {
      onInterstitialClosed?.call();
      return false;
    }
  }

  int _count = 0;

  void showCountedInterstitial({Function? onInterstitialClosed}) {
    _count++;
    final serverCounter = AdSetting.singleton.interstitialCounter;
    if (_count == serverCounter) {
      showInterstitial(onInterstitialClosed: onInterstitialClosed);
      _count = 0;
    } else {
      onInterstitialClosed?.call();
    }
  }
}
