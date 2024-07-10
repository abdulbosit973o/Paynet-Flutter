import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynet_app_flutter/core/utils/colors/lingth_colors.dart';
import 'package:paynet_app_flutter/core/utils/component/text.dart';

import '../../../../../../../../core/utils/formater/nuber_format.dart';

class PaymentCardWidget extends StatelessWidget {
  final VoidCallback clickItem;
  final VoidCallback clickWhatIsThis;
  final VoidCallback clickFill;
  final VoidCallback clickTransfer;
  final VoidCallback clickToPay;
  final String paymentCartFour;
  final int money;
  final bool moneyIsHasEye;

  const PaymentCardWidget(
      {super.key,
      required this.clickItem,
      required this.clickWhatIsThis,
      required this.clickFill,
      required this.clickTransfer,
      required this.clickToPay,
      required this.paymentCartFour,
      required this.money,
      required this.moneyIsHasEye});

  Widget _card(
      {required String svgIcon,
      required String text,
      required VoidCallback clickCard}) {
    return GestureDetector(
      onTap: clickCard,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: LightColors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0.001, 0.001),
                  color: Colors.black12,
                  blurRadius: 6,
                  spreadRadius: 0.002),
            ]),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                svgIcon,
                height: 28,
                width: 28,
                colorFilter: ColorFilter.mode(
                    LightColors.enableButtonColor, BlendMode.srcIn),
              ),
              textBold(text: text, size: 14, color: LightColors.black)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickItem,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              offset: Offset(0.001, 0.001),
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 0.002),
        ], borderRadius: BorderRadius.circular(16), color: LightColors.white),
        child: Column(
          children: [
            Row(
              children: [
                textBold(
                    text: "Paynet karta", size: 16, color: LightColors.black),
                const Spacer(),
                GestureDetector(
                    onTap: clickWhatIsThis,
                    child: textBold(
                        text: "Bu nima?",
                        size: 16,
                        color: LightColors.enableButtonColor)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.asset("assets/icon/ic_payment_card.png",
                        height: 60, width: 72),
                  ),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textNormal(
                          text: "Paynet karta• $paymentCartFour",
                          size: 14,
                          color: LightColors.colorGrey),
                      Row(
                        children: [
                          textBold(
                              text:
                                  (moneyIsHasEye) ? formatInt(money) : ". ...",
                              size: 18,
                              color: LightColors.black),
                          const SizedBox(width: 4),
                          textBold(
                              text: "so'm",
                              size: 18,
                              color: LightColors.colorGreyLight),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                    child: _card(
                        svgIcon: "assets/icon/ic_action_plus.svg",
                        text: "To'ldirish",
                        clickCard: clickFill)),
                const SizedBox(width: 8),
                Expanded(
                    child: _card(
                        svgIcon: "assets/icon/ic_action_transfers.svg",
                        text: "O'tkazish",
                        clickCard: clickTransfer)),
                const SizedBox(width: 8),
                Expanded(
                    child: _card(
                        svgIcon: "assets/icon/ic_operations_wallet.svg",
                        text: "To'lash",
                        clickCard: clickToPay)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
