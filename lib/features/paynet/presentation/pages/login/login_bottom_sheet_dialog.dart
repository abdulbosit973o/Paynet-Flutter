import 'package:flutter/material.dart';

import '../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../core/utils/component/text_my_font.dart';

Widget loginBottomSheetDialog(
    {required VoidCallback clickRu, required VoidCallback clickCancel, required VoidCallback clickUz, required bool uzAndRuLanguage}) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      color: Colors.white,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 6,
          width: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: LightColors.inputContainerColor),
        ),
        Row(
          children: [
            TextMyFont.textBold(text: "Ilova tili", size: 24, color: Colors.black),
            const Spacer(),
            GestureDetector(
              onTap: clickCancel,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: LightColors.inputContainerColor),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),
        GestureDetector(
          onTap: clickRu,
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white, boxShadow: [
              if (!uzAndRuLanguage) BoxShadow(offset: const Offset(1.0, 1.0), color: LightColors.inputContainerColor, blurRadius: 10, spreadRadius: 1),
            ]),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: LightColors.inputContainerColor,
                  ),
                  child: Image.asset(
                    "assets/icon/ru.png",
                    height: 28,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: TextMyFont.textBold(text: "Русский", size: 18, color: Colors.black)),
                if (!uzAndRuLanguage) Icon(Icons.check, color: LightColors.enableButtonColor)
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: clickUz,
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white, boxShadow: [
              if (uzAndRuLanguage)
                BoxShadow(
                  offset: const Offset(1.0, 1.0),
                  color: LightColors.inputContainerColor,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
            ]),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: LightColors.inputContainerColor,
                  ),
                  child: Image.asset(
                    "assets/icon/uz.png",
                    height: 28,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: TextMyFont.textBold(text: "O'zbek", size: 18, color: Colors.black)),
                if (uzAndRuLanguage) Icon(Icons.check, color: LightColors.enableButtonColor)
              ],
            ),
          ),
        ),
        const SizedBox(height: 36)
      ],
    ),
  );
}
