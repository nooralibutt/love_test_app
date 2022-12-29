import 'package:flutter/material.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/quiz_screen.dart';
import 'package:love_test_app/screen/result_screen/result_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (_) => const HomeScreen(),
  QuizScreen.routeName: (_) => const QuizScreen(),
  ResultScreen.routeName: (_) => const ResultScreen(),
};
