import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/data/model/card_model.dart';

import '../../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../../core/utils/component/text_my_font.dart';
import '../../../../../../core/utils/formater/nuber_format.dart';
import '../../../../../../core/utils/gradent/card_gradient.dart';
import '../../../../../../core/utils/status/card_status.dart';

class CardItem extends StatelessWidget {
  final CardModel cardData;
  final VoidCallback clickCard;

  const CardItem({super.key, required this.cardData, required this.clickCard});

  @override
  Widget build(BuildContext context) {
    var status = cardData.cardStatus;
    var cardNumber = cardData.cardNumber.substring(0, 7) + "** ****" + cardData.cardNumber.substring(14, cardData.cardNumber.length);
    return GestureDetector(
      onTap: clickCard,
      child: Container(
        height: 210,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(gradient: CardGradient.gradient[cardData.gradientIndex], borderRadius: BorderRadius.circular(24)),
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icon/ic_card_icons.png",
                  height: 36,
                  width: 36,
                ),
                const Spacer(),
                if (status == CardStatus.Humo.name)
                  Image.asset(
                    "assets/icon/humo.png",
                    height: 36,
                    width: 100,
                    color: LightColors.white,
                  ),
                if (status == CardStatus.Mastercard.name)
                  Image.asset(
                    "assets/icon/master_card.png",
                    height: 36,
                    width: 120,
                    color: LightColors.white,
                  ),
                if (status == CardStatus.Uzcard.name)
                  Image.asset(
                    "assets/icon/uzcard.png",
                    height: 36,
                    width: 100,
                    color: LightColors.white,
                  ),
                if (status == CardStatus.Mir.name)
                  Image.asset(
                    "assets/icon/mir.png",
                    height: 36,
                    width: 100,
                    color: LightColors.white,
                  ),
                if (status == CardStatus.Visa.name)
                  Image.asset(
                    "assets/icon/visa.png",
                    height: 36,
                    width: 100,
                    color: LightColors.white,
                  )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                TextMyFont.textBold(text: formatInt(cardData.cardParse), size: 32, color: LightColors.white),
                const SizedBox(width: 8),
                TextMyFont.textBold(text: "so'm", size: 32, color: LightColors.colorGreyLight),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                TextMyFont.textNormal(text: cardNumber, size: 16, color: LightColors.white),
                const Spacer(),
                TextMyFont.textNormal(text: cardData.cardYear, size: 16, color: LightColors.white),
              ],
            ),
            const Spacer(),
            // const Spacer(),
            TextMyFont.textBold(
                text: (status == CardStatus.Humo.name)
                    ? "HUMO"
                    : (status == CardStatus.Mastercard.name)
                        ? "MASTERCARD"
                        : (status == CardStatus.Uzcard.name)
                            ? "UZCARD"
                            : (status == CardStatus.Mir.name)
                                ? "Mir"
                                : (status == CardStatus.Visa.name)
                                    ? "VISA"
                                    : "UNKNOWN",
                size: 18,
                color: LightColors.white)
          ],
        )),
      ),
    );
  }
}
