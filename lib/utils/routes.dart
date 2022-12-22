import 'package:flutter/material.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (_) => const HomeScreen(),
};