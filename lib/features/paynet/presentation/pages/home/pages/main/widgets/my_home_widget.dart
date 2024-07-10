import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomeWidget extends StatelessWidget {
  final VoidCallback addHome;
  final VoidCallback clickMyHome;
  final VoidCallback addColculation;

  const MyHomeWidget({super.key, required this.addHome, required this.clickMyHome, required this.addColculation});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      child: GestureDetector(
        onTap: (){

        },
      ),
    );
  }
}
