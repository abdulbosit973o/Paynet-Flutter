import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/main_app_bar.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: MainAppBar(),
      backgroundColor: Color(0xfff3f4f9),
    );
  }
}
