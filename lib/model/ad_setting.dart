import 'dart:convert';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

enum AdPriority { admob, appLovin, unity, facebook, any }

extension AdPriorityExtension on AdPriority {
  String get value => describeEnum(this);
}

const adPriorityStringToEnumMap = {
  'admob': AdPriority.admob,
  'appLovin': AdPriority.appLovin,
  'unity': AdPriority.unity,
  'facebook': AdPriority.facebook,
  'any': AdPriority.any,
};

const _defaultAdPriority = [
  AdPriority.admob,
  AdPriority.facebook,
  AdPriority.unity,
  AdPriority.appLovin,
  AdPriority.any
];

class AdSetting {
  static const _endPoint =
      '/com.hypertension.blood.normal.low.pressure.bp.heart.disease.cholestrol.json';

  static AdSetting singleton = const AdSetting();

  final List<AdPriority> adPriorityList;
  final List<AdPriority> bannerAdPriorityList;
  final bool isAndroidApproving;
  final bool isIosApproving;
  final int interstitialCounter;

  const AdSetting({
    this.adPriorityList = _defaultAdPriority,
    this.bannerAdPriorityList = _defaultAdPriority,
    this.isIosApproving = true,
    this.isAndroidApproving = true,
    this.interstitialCounter = 2,
  });

  factory AdSetting._fromMap(Map<String, dynamic> map) {
    return AdSetting(
      adPriorityList: _toList(map["ad_priority"]),
      bannerAdPriorityList: _toList(map["banner_ad_priority"]),
      isAndroidApproving: map["is_android_approving"],
      isIosApproving: map["is_ios_approving"],
      interstitialCounter: map["interstitial_ad_count"],
    );
  }

  static List<AdPriority> _toList(final List<dynamic> list) => list
      .map<AdPriority>(
          (e) => adPriorityStringToEnumMap[e.toString()] ?? AdPriority.any)
      .toList();

  List<AdNetwork> getBannerPriorityList() {
    final List<AdNetwork> list = [];
    for (int i = 0; i < bannerAdPriorityList.length; i++) {
      if (bannerAdPriorityList[i] == AdPriority.admob) {
        list.add(AdNetwork.admob);
      } else if (bannerAdPriorityList[i] == AdPriority.facebook) {
        list.add(AdNetwork.facebook);
      } else if (bannerAdPriorityList[i] == AdPriority.appLovin) {
        list.add(AdNetwork.appLovin);
      } else if (bannerAdPriorityList[i] == AdPriority.unity) {
        list.add(AdNetwork.unity);
      }
    }
    return list;
  }

  static Future<void> fetch() async {
    var url = Uri.https('nooralibutt.github.io', _endPoint);
    final response = await http.get(url,
        headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'});
    if (response.statusCode == 200) {
      final str = utf8.decode(response.bodyBytes).replaceAll('\n', '');
      final decodedResponse = jsonDecode(str) as Map<String, dynamic>;
      AdSetting.singleton = AdSetting._fromMap(decodedResponse);
    }
  }
}
