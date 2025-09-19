import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/features/authentication/presentation/login.dart';
import 'package:clinic/features/authentication/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
          settings: settings,
        );

      case Routes.getStarted:
        return MaterialPageRoute(
          builder: (_) => GetStartedScreen(),
          settings: settings,
        );

      case Routes.login:
        return MaterialPageRoute(builder: (_) => Login(), settings: settings);

      case Routes.register:
        return MaterialPageRoute(builder: (_) => SignUp(), settings: settings);

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text("This Route did't Recognize")),
              ), // fallback screen
          settings: settings,
        );
    }
  }
}
