 import 'package:flutter/material.dart';
import 'package:productive/core/pages/error.dart';
import 'package:productive/features/authentication/presentation/login_screen.dart';
import 'package:productive/features/home/home.dart';

import '../../features/authentication/presentation/pages/splash.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) =>  const SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
} 