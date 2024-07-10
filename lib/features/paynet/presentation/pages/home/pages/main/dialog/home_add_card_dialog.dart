import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../../../../core/utils/component/text_my_font.dart';

Widget homeAddCardDialog({required VoidCallback clickRu, required VoidCallback clickCancel, required VoidCallback clickUz}) {
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
          height: 5,
          width: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: LightColors.colorGreyLight),
        ),
        Row(
          children: [
            TextMyFont.textBold(text: "Qanday kartani qoshish kerak?", size: 22, color: LightColors.black),
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
        const SizedBox(height: 8),
        GestureDetector(
          onTap: clickUz,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: LightColors.inputContainerColor,
                  ),
                  child: Image.asset(
                    "assets/icon/image_uz_cricl.png",
                    height: 28,
                    width: 28,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: TextMyFont.textNormal(text: "O'zbekiston kartasi", size: 16, color: LightColors.black)),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: clickRu,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: LightColors.inputContainerColor,
                  ),
                  child: Image.asset(
                    "assets/icon/ic_russion_rubl.png",
                    height: 28,
                    width: 28,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: TextMyFont.textNormal(text: "Rossiya kartasi", size: 16, color: LightColors.black)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    ),
  );
}
