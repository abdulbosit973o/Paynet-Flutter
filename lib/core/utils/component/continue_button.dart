import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/core/utils/colors/lingth_colors.dart';


Widget continueButton({required VoidCallback clickButton, required bool disableAndEnable, required String buttonText}) {
  return GestureDetector(
    onTap: clickButton,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: (disableAndEnable) ? LightColors.enableButtonColor : LightColors.disableButtonColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(child: Text(buttonText, style: TextStyle(color: (disableAndEnable) ? Colors.white :LightColors.disableButtonTextColor, fontSize: 18,fontFamily: "PaynetB"))),
    ),
  );
}
