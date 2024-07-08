import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/splash/splash_screen.dart';

import 'features/paynet/presentation/pages/pin_code_creator/pin_create_screen.dart';

void main() {
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
      home: const PinScreen(),
    );
  }
}
