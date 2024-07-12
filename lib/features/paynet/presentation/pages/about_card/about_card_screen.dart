import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/data/model/card_model.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/all_card/widget/card_item.dart';

import '../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../core/utils/component/text_my_font.dart';

class AboutCardScreen extends StatelessWidget {
  final CardModel cardData;

  const AboutCardScreen({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.mainBackgroundColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Icon(Icons.arrow_back, color: LightColors.colorGrey)),
        title: TextMyFont.textBold(text: cardData.cardStatus, size: 24, color: LightColors.black),
      ),
      body: Column(
        children: [
          CardItem(cardData: cardData, clickCard: (){})

        ],
      ),

    );
  }
}
