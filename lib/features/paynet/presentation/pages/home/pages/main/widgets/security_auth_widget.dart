import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/core/utils/assets/app_image.dart';

import '../../../../../../../../core/utils/colors/lingth_colors.dart';

class SecurityAuthWidget extends StatelessWidget {
  final VoidCallback clickItem;

  const SecurityAuthWidget({super.key, required this.clickItem});

  @override
  Widget build(BuildContext context) {
    late List<Color> authWidget = [
      LightColors.listItem1,
      LightColors.listItem2,
      LightColors.listItem3
    ];
    return Container(
      decoration: BoxDecoration(
          color: LightColors.enableButtonColor,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors:authWidget)),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: GestureDetector(
          onTap: clickItem,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: 'Paynetda xavfsizlik',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'PaynetB')),
                        TextSpan(
                            text: 'Xavfsizlikni oshirishni xoxlaysizmi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'PaynetM')),
                      ]),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Text(
                        'Shaxsingizni tasdiqlang',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'PaynetM'),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: Image.asset(AppImage.security_indentification)),
            ],
          ),
        ),
      ),
    );
  }
}
