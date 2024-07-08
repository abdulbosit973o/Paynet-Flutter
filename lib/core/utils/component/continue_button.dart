import 'package:flutter/material.dart';

import '../colors/app_color.dart';

Widget continueButton({required VoidCallback clickButton, required bool disableAndEnable, required String buttonText}) {
  return GestureDetector(
    onTap: clickButton,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: (disableAndEnable) ? enableButtonColor : disableButtonColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(child: Text(buttonText, style: TextStyle(color: (disableAndEnable) ? Colors.white : disableButtonTextColor, fontSize: 18,fontFamily: "PaynetB"))),
    ),
  );
}
