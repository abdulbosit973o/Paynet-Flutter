import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/core/utils/colors/lingth_colors.dart';
import 'package:paynet_app_flutter/core/utils/component/text_my_font.dart';
import 'package:paynet_app_flutter/core/utils/formater/nuber_format.dart';

class MyMoneyWidget extends StatelessWidget {
  final int money;
  final bool moneyIsHasEye;
  final VoidCallback clickEye;

  const MyMoneyWidget({super.key, required this.money, required this.moneyIsHasEye, required this.clickEye});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMyFont.textNormal(text: "Mening pulim", size: 14, color: LightColors.colorGreyLight),
          Row(
            children: [
              TextMyFont.textBold(text: (moneyIsHasEye) ? formatInt(money) : ". ...", size: 26, color: LightColors.black),
              const SizedBox(width: 8),
              TextMyFont.textBold(text: "so'm", size: 24, color: LightColors.colorGreyLight),
              const Spacer(),
              IconButton(
                onPressed: clickEye,
                icon: Icon((moneyIsHasEye) ? Icons.visibility : Icons.visibility_off, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
