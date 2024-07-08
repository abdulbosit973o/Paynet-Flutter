import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:paynet_app_flutter/features/paynet/bloc/login/login_bloc.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/login/login_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/splash/splash_status.dart';

import '../../../bloc/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.status == SplashStatus.login) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => LoginBloc(),
                        child: const LoginScreen(),
                      )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Lottie.asset("assets/lotti/splash.json", fit: BoxFit.cover, height: double.infinity, width: double.infinity),
        );
      },
    );
  }
}
