import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/component/text_my_font.dart';

class TopTexts extends StatelessWidget {
  final bool isShow;
  final VoidCallback onTap;

  const TopTexts({super.key, required this.onTap, required this.isShow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          TextMyFont.textBold(
            text: "To'lov",
            size: 28,
            color: const Color(0xff1f2025),
          ),
          const Spacer(),
          if (isShow)
            GestureDetector(
              onTap: onTap,
              child: Card(
                elevation: 2,
                borderOnForeground: true,
                child: Container(
                  height: 36,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white60),
                  child: Center(
                      child: TextMyFont.textBold(
                          text: "Bekor qilish", size: 16, color: Colors.black)),
                ),
              ),
            )
        ],
      ),
    );
  }
}
