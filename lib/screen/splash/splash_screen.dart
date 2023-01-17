import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/services/ad_manager.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), load);
  }

  void load() async {
    TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    if (Platform.isIOS) {
      if (status == TrackingStatus.notDetermined) {
        status = await AppTrackingTransparency.requestTrackingAuthorization();
      }

      await UnityAds.setPrivacyConsent(
          PrivacyConsentType.gdpr, status == TrackingStatus.authorized);
      await UnityAds.setPrivacyConsent(
          PrivacyConsentType.ccpa, status == TrackingStatus.authorized);
      await UnityAds.setPrivacyConsent(
          PrivacyConsentType.pipl, status == TrackingStatus.authorized);

      await Future.delayed(const Duration(seconds: 1));
    }

    await UnityAds.setPrivacyConsent(PrivacyConsentType.ageGate, true);
    await AdManager.instance
        .initialize(isTrackingEnabled: status == TrackingStatus.authorized);

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 120.w),
        child: const Image(image: AssetImage('assets/icon.jpg')),
      ),
    );
  }
}
