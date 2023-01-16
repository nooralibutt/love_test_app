import 'dart:io';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';

class AdIdManager extends IAdIdManager {
  const AdIdManager();

  @override
  AppAdIds? get admobAdIds => const AppAdIds(
        appId: 'ca-app-pub-4261801828815757~6027277750',
        bannerId: 'ca-app-pub-4261801828815757/8461869408',
        interstitialId: 'ca-app-pub-4261801828815757/9774951071',
      );

  @override
  AppAdIds? get unityAdIds => AppAdIds(
        appId: Platform.isAndroid ? '5119687' : '5119686',
        bannerId: Platform.isAndroid ? 'Banner_Android' : 'Banner_iOS',
        interstitialId:
            Platform.isAndroid ? 'Interstitial_Android' : 'Interstitial_iOS',
        rewardedId: Platform.isAndroid ? 'Rewarded_Android' : 'Rewarded_iOS',
      );

  @override
  AppAdIds? get appLovinAdIds => const AppAdIds(
        appId:
            'OeKTS4Zl758OIlAs3KQ6-3WE1IkdOo3nQNJtRubTzlyFU76TRWeQZAeaSMCr9GcZdxR4p2cnoZ1Gg7p7eSXCdA',
        interstitialId: 'fc3539edce1d74a0',
        bannerId: '5632b62ad7e1e3d5',
      );

  @override
  AppAdIds? get fbAdIds => const AppAdIds(
        appId: '1892833024385933',
        bannerId: '1892833024385933_1892833374385898',
        interstitialId: '1892833024385933_1892833767719192',
      );
}
