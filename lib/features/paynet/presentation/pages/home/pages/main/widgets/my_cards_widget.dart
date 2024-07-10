import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/core/utils/component/box_shadow_custom.dart';
import 'package:paynet_app_flutter/core/utils/component/text_my_font.dart';
import 'package:paynet_app_flutter/core/utils/gradent/card_gradient.dart';
import 'package:paynet_app_flutter/core/utils/status/card_status.dart';
import 'package:paynet_app_flutter/features/paynet/data/model/card_model.dart';

import '../../../../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../../../../core/utils/formater/nuber_format.dart';

class MyCardsWidget extends StatelessWidget {
  final VoidCallback clickAddCard;
  final List<CardModel> cardList;
  final bool moneyIsHasEye;
  final int keshbekMoney;

  const MyCardsWidget({super.key, required this.clickAddCard, required this.cardList, required this.moneyIsHasEye, required this.keshbekMoney});

  Widget _emptyCard({required VoidCallback clickCard}) {
    return GestureDetector(
      onTap: clickCard,
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: LightColors.white, boxShadow: BoxShadowCustom.boxShadow),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icon/ic_add_card.png", height: 40, width: 50),
            const SizedBox(height: 12),
            TextMyFont.textBold(text: "Karta qo'shish", size: 12, color: LightColors.black)
          ],
        ),
      ),
    );
  }

  Widget _oneCard({required VoidCallback clickCard}) {
    var cardData = cardList[0];
    var status = cardData.cardStatus;
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: LightColors.mainBackgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
               child: Center(child: TextMyFont.textNormal(text: "Karta qo'shish", size: 14, color: LightColors.black))),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(gradient: CardGradient.gradient[cardData.gradientIndex], borderRadius: BorderRadius.circular(16)),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icon/ue_flag.png",
                      height: 24,
                      width: 24,
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/icon/ic_text_humo.png",
                      height: 28,
                      width: 60,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextMyFont.textBold(text: (moneyIsHasEye) ? formatInt(cardData.cardParse) : ". ...", size: 14, color: LightColors.white),
                    const SizedBox(width: 8),
                    TextMyFont.textBold(text: "so'm", size: 14, color: LightColors.colorGreyLight),
                  ],
                ),
                const Spacer(),
                TextMyFont.textBold(
                    text: (status == CardStatus.humo)
                        ? "HUMO"
                        : (status == CardStatus.mastercard)
                            ? "MASTERCARD"
                            : (status == CardStatus.uzcard)
                                ? "UZCARD"
                                : (status == CardStatus.mir)
                                    ? "Mir"
                                    : (status == CardStatus.visa)
                                        ? "VISA"
                                        : "UNKNOWN",
                    size: 14,
                    color: LightColors.white)
              ],
            )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 220,
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(boxShadow: BoxShadowCustom.boxShadow, borderRadius: BorderRadius.circular(16), color: LightColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TextMyFont.textBold(text: "Kartalarim", size: 16, color: LightColors.black),
                  ),
                  const SizedBox(height: 8),
                  if (cardList.isEmpty) Expanded(child: _emptyCard(clickCard: () {})),
                  if (cardList.length == 1) Expanded(child: _oneCard(clickCard: () {})),
                ],
              ),
            )),
            const SizedBox(width: 12),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(offset: Offset(0.001, 0.001), color: Colors.black12, blurRadius: 10, spreadRadius: 0.002),
              ], borderRadius: BorderRadius.circular(16), color: LightColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TextMyFont.textBold(text: "Keshbek-hisob", size: 16, color: LightColors.black),
                  ),
                  const SizedBox(height: 4),
                  TextMyFont.textNormal(text: "Balans", size: 14, color: LightColors.colorGrey),
                  Row(
                    children: [
                      TextMyFont.textBold(text: (moneyIsHasEye) ? formatInt(keshbekMoney) : ". ...", size: 16, color: LightColors.black),
                      const SizedBox(width: 8),
                      TextMyFont.textBold(text: "so'm", size: 16, color: LightColors.colorGreyLight),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    // margin: const EdgeInsets.all(12),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15), color: LightColors.white, boxShadow: BoxShadowCustom.boxShadow),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextMyFont.textNormal(text: "Bugun", size: 10, color: LightColors.colorGrey),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: LightColors.enableButtonColor),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                child: TextMyFont.textBold(
                                    text: (moneyIsHasEye) ? "${formatInt(keshbekMoney)} so'm" : ". ... so'm", size: 10, color: LightColors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
