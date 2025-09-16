import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/features/authentication/presentation/login.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.onboarding:
      //   return MaterialPageRoute(
      //     builder: (_) => OnBoardingScreen(),
      //     settings: settings,
      //   );

      case Routes.login:
        return MaterialPageRoute(builder: (_) => Login(), settings: settings);

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => Scaffold(),
          // RegisterScreen(),

          // settings: settings,
        );

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
