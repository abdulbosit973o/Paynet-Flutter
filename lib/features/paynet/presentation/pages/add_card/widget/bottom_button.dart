import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors/lingth_colors.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback clickButton;
  final bool buttonVisible;
  final String buttonText;
  const BottomButton({super.key, required this.clickButton, required this.buttonVisible, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)), color: LightColors.white),
        child: GestureDetector(
          onTap: (buttonVisible)
              ? clickButton
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (buttonVisible) ? LightColors.enableButtonColor : LightColors.disableButtonColor,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                  child: Text(buttonText,
                      style: TextStyle(
                          color: (buttonVisible) ? Colors.white : LightColors.disableButtonTextColor,
                          fontSize: 18,
                          fontFamily: "PaynetB"))),
            ),
          ),
        ));

  }

}
