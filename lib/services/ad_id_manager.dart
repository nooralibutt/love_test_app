import 'dart:io';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';

class AdIdManager extends IAdIdManager {
  const AdIdManager();

  @override
  AppAdIds? get admobAdIds => AppAdIds(
        appId:
            Platform.isAndroid ? '' : 'ca-app-pub-9376647217016516~7235825406',
        appOpenId:
            Platform.isAndroid ? '' : 'ca-app-pub-9376647217016516/3038103637',
        bannerId:
            Platform.isAndroid ? '' : 'ca-app-pub-9376647217016516/4368616732',
        interstitialId:
            Platform.isAndroid ? '' : 'ca-app-pub-9376647217016516/5664266976',
        rewardedId:
            Platform.isAndroid ? '' : 'ca-app-pub-9376647217016516/6024441199',
      );

  @override
  AppAdIds? get unityAdIds => AppAdIds(
        appId: Platform.isAndroid ? '4380053' : '4702876',
        bannerId: Platform.isAndroid ? 'Banner_Android' : 'Banner_iOS',
        interstitialId:
            Platform.isAndroid ? 'Interstitial_Android' : 'Interstitial_iOS',
        rewardedId: Platform.isAndroid ? 'Rewarded_Android' : 'Rewarded_iOS',
      );

  @override
  AppAdIds? get appLovinAdIds => AppAdIds(
        appId:
            'OeKTS4Zl758OIlAs3KQ6-3WE1IkdOo3nQNJtRubTzlyFU76TRWeQZAeaSMCr9GcZdxR4p2cnoZ1Gg7p7eSXCdA',
        interstitialId:
            Platform.isAndroid ? '286c73782fce6457' : '705a73e1fb071640',
      );

  @override
  AppAdIds? get fbAdIds => AppAdIds(
        appId: '222861849563328',
        bannerId: Platform.isAndroid ? '' : '222861849563328_491138746068969',
        interstitialId:
            Platform.isAndroid ? '' : '222861849563328_222886062894240',
      );
}
