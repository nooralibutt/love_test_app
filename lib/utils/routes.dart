import 'package:flutter/material.dart';
import 'package:love_test_app/chat_screen/chat/love_chat_screen.dart';
import 'package:love_test_app/chat_screen/love_chat_level_screen.dart';
import 'package:love_test_app/screen/call_screen/call_screen.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/quiz_screen.dart';
import 'package:love_test_app/screen/quiz_list_screen/quiz_list_screen.dart';
import 'package:love_test_app/screen/result_screen/result_screen.dart';
import 'package:love_test_app/screen/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (_) => const SplashScreen(),
  HomeScreen.routeName: (_) => const HomeScreen(),
  QuizScreen.routeName: (_) => const QuizScreen(),
  ResultScreen.routeName: (_) => const ResultScreen(),
  QuizListScreen.routeName: (_) => const QuizListScreen(),
  CallScreen.routeName: (_) => const CallScreen(),
  LoveChatLevelScreen.routeName: (_) => const LoveChatLevelScreen(),
  LoveChatScreen.routeName: (_) => const LoveChatScreen(),
};
