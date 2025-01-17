import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:paynet_app_flutter/features/paynet/bloc/login/login_bloc.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/home_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/login/login_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/splash/splash_status.dart';

import '../../../bloc/splash/splash_bloc.dart';
import '../../widgets/custom_navigation.dart';
import '../pin_code/pin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.status == SplashStatus.login) {
          CustomNavigation.pushReplacement(
              context,
              BlocProvider(
                create: (context) => LoginBloc(),
                child: const LoginScreen(),
              ));
        } else if (state.status == SplashStatus.pinCode) {
          CustomNavigation.push(context, const HomeScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Lottie.asset(
          "assets/lotti/splash.json",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ));
      },
    );
  }
}
