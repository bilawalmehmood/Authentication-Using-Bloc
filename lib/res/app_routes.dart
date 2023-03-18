import 'package:authenticatio_with_bloc/screens/auth/bloc/auth_bloc.dart';
import 'package:authenticatio_with_bloc/screens/auth/sign_in_screen.dart';
import 'package:authenticatio_with_bloc/screens/auth/sign_in_with_phone_screen.dart';
import 'package:authenticatio_with_bloc/screens/auth/verify_otp_screen.dart';
import 'package:authenticatio_with_bloc/screens/auth/welcome_sreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/auth/cubit/auth_cubit.dart';
import '../screens/home/home_screen.dart';

class AppRoutes {
  static Route? onGenratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/welcome_sreen":
        return MaterialPageRoute(
          builder: (ctd) => const WelcomeScreen(),
        );
      case "/sign_in_screen":
        return MaterialPageRoute(
          builder: (ctd) => BlocProvider(
            create: (context) => AuthBloc(),
            child: SignInScreen(),
          ),
        );
      case "/sign_in_with_phone_screen":
        return MaterialPageRoute(
          builder: (ctd) => BlocProvider(
            create: (context) => AuthCubit(),
            child: SignInWithPhoneScreen(),
          ),
        );
      case "/verify_otp_screen":
        String verificationId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (ctd) => BlocProvider(
            create: (context) => AuthCubit(),
            child: VerifyOtpScreen(
              verificationId: verificationId,
            ),
          ),
        );
      case "/home_sc122345reen":
        return MaterialPageRoute(
          builder: (ctd) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
