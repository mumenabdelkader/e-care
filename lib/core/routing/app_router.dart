import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/presentation/controller/register/auth_cubit.dart';
import 'package:clinic/features/authentication/presentation/forgot_password_screen.dart';
import 'package:clinic/features/authentication/presentation/login_screen.dart';
import 'package:clinic/features/authentication/presentation/new_password_screen.dart';
import 'package:clinic/features/authentication/presentation/patient_information_screen.dart';
import 'package:clinic/features/authentication/presentation/register_screen.dart';
import 'package:clinic/features/authentication/presentation/verify_otp_screen.dart';
import 'package:clinic/features/home/home_screen.dart';
import 'package:clinic/features/onboarding/get_started_screen.dart';
import 'package:clinic/features/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/presentation/reset_password_screen.dart';

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
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<AuthCubit>(),
                child: LoginScreen(),
              ),
          settings: settings,
        );

      case Routes.register:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<AuthCubit>(),
                child: RegisterScreen(),
              ),
          settings: settings,
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => ForgotPassowrdScreen(),
          settings: settings,
        );

      case Routes.resetPassword:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<AuthCubit>(),
                child: ResetPasswordScreen(),
              ),
          settings: settings,
        );

      //?????????
      case Routes.verifyRegisterOtp:
        final args = settings.arguments as Map<String, dynamic>;
        final isNewRegister = args['isNewRegister'] as bool;
        final registerData = args['registerData'] as RegisterReqsuestBodyModel?;
        final forgotPasswordData = args['forgotPasswordData'] as String?;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<AuthCubit>(),
                child: VerifyOtpScreen(
                  isNewRegister: isNewRegister,
                  registerData: registerData,
                  forgotPasswordData: forgotPasswordData,
                ),
              ),
          settings: settings,
        );

      //?????????
      case Routes.verifyPasswordRestOtp:
        final args = settings.arguments as Map<String, dynamic>;
        final isNewRegister = args['isNewRegister'] as bool;
        final registerData = args['registerData'] as RegisterReqsuestBodyModel?;
        final forgotPasswordData = args['forgotPasswordData'] as String?;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<AuthCubit>(),
                child: VerifyOtpScreen(
                  isNewRegister: isNewRegister,
                  registerData: registerData,
                  forgotPasswordData: forgotPasswordData,
                ),
              ),
          settings: settings,
        );

      case Routes.newPassword:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<AuthCubit>(),
                child: NewPasswordScreen(email: email),
              ),
          settings: settings,
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      case Routes.patientInfo:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<AuthCubit>(),
                child: PatientInformationScreen(),
              ),
          settings: settings,
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
