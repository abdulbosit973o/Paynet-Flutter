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
  final VoidCallback clickCard1;
  final VoidCallback clickCard2;
  final VoidCallback clickAllCard;

  const MyCardsWidget(
      {super.key,
      required this.clickAddCard,
      required this.cardList,
      required this.moneyIsHasEye,
      required this.keshbekMoney,
      required this.clickCard1,
      required this.clickCard2,
      required this.clickAllCard});

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

  Widget _oneCard({required VoidCallback clickCard, required VoidCallback clickAddCard}) {
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
            child: GestureDetector(
              onTap: clickAddCard,
              child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(child: TextMyFont.textNormal(text: "Karta qo'shish", size: 14, color: LightColors.black))),
            ),
          ),
          GestureDetector(
            onTap: clickCard,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(gradient: CardGradient.gradient[cardData.gradientIndex], borderRadius: BorderRadius.circular(16)),
              child: (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icon/ic_card_icons.png",
                        height: 24,
                        width: 24,
                      ),
                      const Spacer(),
                      if (status == CardStatus.Humo.name)
                        Image.asset(
                          "assets/icon/humo.png",
                          height: 28,
                          width: 60,
                          color: LightColors.white,
                        ),
                      if (status == CardStatus.Mastercard.name)
                        Image.asset(
                          "assets/icon/master_card.png",
                          height: 28,
                          width: 70,
                          color: LightColors.white,
                        ),
                      if (status == CardStatus.Uzcard.name)
                        Image.asset(
                          "assets/icon/uzcard.png",
                          height: 28,
                          width: 60,
                          color: LightColors.white,
                        ),
                      if (status == CardStatus.Mir.name)
                        Image.asset(
                          "assets/icon/mir.png",
                          height: 28,
                          width: 60,
                          color: LightColors.white,
                        ),
                      if (status == CardStatus.Visa.name)
                        Image.asset(
                          "assets/icon/visa.png",
                          height: 28,
                          width: 60,
                          color: LightColors.white,
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
                      size: 12,
                      color: LightColors.white)
                ],
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget _allCard({required VoidCallback clickCard1, required VoidCallback clickCard2}) {
    var cardData1 = cardList[0];
    var cardData2 = cardList[1];
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: LightColors.mainBackgroundColor),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: clickCard1,
              child: Container(
                height: 96,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(gradient: CardGradient.gradient[cardData1.gradientIndex], borderRadius: BorderRadius.circular(16)),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icon/ic_card_icons.png",
                          height: 24,
                          width: 24,
                        ),
                        const Spacer(),
                        if (cardData1.cardStatus == CardStatus.Humo.name)
                          Image.asset(
                            "assets/icon/humo.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          ),
                        if (cardData1.cardStatus == CardStatus.Mastercard.name)
                          Image.asset(
                            "assets/icon/master_card.png",
                            height: 28,
                            width: 70,
                            color: LightColors.white,
                          ),
                        if (cardData1.cardStatus == CardStatus.Uzcard.name)
                          Image.asset(
                            "assets/icon/uzcard.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          ),
                        if (cardData1.cardStatus == CardStatus.Mir.name)
                          Image.asset(
                            "assets/icon/mir.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          ),
                        if (cardData1.cardStatus == CardStatus.Visa.name)
                          Image.asset(
                            "assets/icon/visa.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        TextMyFont.textBold(text: (moneyIsHasEye) ? formatInt(cardData1.cardParse) : ". ...", size: 14, color: LightColors.white),
                        const SizedBox(width: 8),
                        TextMyFont.textBold(text: "so'm", size: 14, color: LightColors.colorGreyLight),
                      ],
                    ),
                    const Spacer(),
                    TextMyFont.textBold(
                        text: (cardData1.cardStatus == CardStatus.Humo.name)
                            ? "HUMO"
                            : (cardData1.cardStatus == CardStatus.Mastercard.name)
                                ? "MASTERCARD"
                                : (cardData1.cardStatus == CardStatus.Uzcard.name)
                                    ? "UZCARD"
                                    : (cardData1.cardStatus == CardStatus.Mir.name)
                                        ? "Mir"
                                        : (cardData1.cardStatus == CardStatus.Visa.name)
                                            ? "VISA"
                                            : "UNKNOWN",
                        size: 12,
                        color: LightColors.white)
                  ],
                )),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: clickCard2,
              child: Container(
                height: 96,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(gradient: CardGradient.gradient[cardData2.gradientIndex], borderRadius: BorderRadius.circular(16)),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icon/ic_card_icons.png",
                          height: 24,
                          width: 24,
                        ),
                        const Spacer(),
                        if (cardData2.cardStatus == CardStatus.Humo.name)
                          Image.asset(
                            "assets/icon/humo.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          ),
                        if (cardData2.cardStatus == CardStatus.Mastercard.name)
                          Image.asset(
                            "assets/icon/master_card.png",
                            height: 28,
                            width: 70,
                            color: LightColors.white,
                          ),
                        if (cardData2.cardStatus == CardStatus.Uzcard.name)
                          Image.asset(
                            "assets/icon/uzcard.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          ),
                        if (cardData2.cardStatus == CardStatus.Mir.name)
                          Image.asset(
                            "assets/icon/mir.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          ),
                        if (cardData2.cardStatus == CardStatus.Visa.name)
                          Image.asset(
                            "assets/icon/visa.png",
                            height: 28,
                            width: 60,
                            color: LightColors.white,
                          )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        TextMyFont.textBold(text: (moneyIsHasEye) ? formatInt(cardData2.cardParse) : ". ...", size: 14, color: LightColors.white),
                        const SizedBox(width: 8),
                        TextMyFont.textBold(text: "so'm", size: 14, color: LightColors.colorGreyLight),
                      ],
                    ),
                    const Spacer(),
                    TextMyFont.textBold(
                        text: (cardData2.cardStatus == CardStatus.Humo.name)
                            ? "HUMO"
                            : (cardData2.cardStatus == CardStatus.Mastercard.name)
                                ? "MASTERCARD"
                                : (cardData2.cardStatus == CardStatus.Uzcard.name)
                                    ? "UZCARD"
                                    : (cardData2.cardStatus == CardStatus.Mir.name)
                                        ? "Mir"
                                        : (cardData2.cardStatus == CardStatus.Visa.name)
                                            ? "VISA"
                                            : "UNKNOWN",
                        size: 12,
                        color: LightColors.white)
                  ],
                )),
              ),
            ),
          ),
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
                    child: Row(
                      children: [
                        TextMyFont.textBold(text: "Kartalarim", size: 16, color: LightColors.black),
                        Spacer(),
                        if (cardList.length == 2)
                          GestureDetector(
                              onTap: clickAddCard,
                              child: Icon(
                                Icons.add_circle,
                                color: LightColors.enableButtonColor,
                              )),
                        if (cardList.length > 2)
                          GestureDetector(
                            onTap: clickAllCard,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: LightColors.enableButtonColor),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                                    child: TextMyFont.textBold(text: cardList.length.toString(), size: 12, color: LightColors.white),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: LightColors.colorGrey,
                                  size: 18,
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (cardList.isEmpty) Expanded(child: _emptyCard(clickCard: clickAddCard)),
                  if (cardList.length == 1) Expanded(child: _oneCard(clickCard: clickCard1, clickAddCard: clickAddCard)),
                  if (cardList.length >= 2) Expanded(child: _allCard(clickCard1: clickCard1, clickCard2: clickCard2)),
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
