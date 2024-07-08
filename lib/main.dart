import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynet_app_flutter/core/utils/hive/hive_helper.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/home_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/splash/splash_screen.dart';

import 'features/paynet/bloc/splash/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xffffffff),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => SplashBloc()..add(SplashEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
