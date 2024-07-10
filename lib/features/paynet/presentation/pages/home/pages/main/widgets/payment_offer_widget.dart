import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynet_app_flutter/core/utils/colors/lingth_colors.dart';
import 'package:paynet_app_flutter/core/utils/component/text.dart';

import '../../../../../../../../core/utils/formater/nuber_format.dart';

class PaymentOfferWidget extends StatelessWidget {
  final VoidCallback clickItem;
  final VoidCallback clickWhatIsThis;
  final VoidCallback clickFill;
  final VoidCallback clickTransfer;
  final VoidCallback clickToPay;
  final String paymentCartFour;
  final int money;
  final bool moneyIsHasEye;

  const PaymentOfferWidget(
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0.001, 0.001),
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 0.002,
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              SvgPicture.asset(
                svgIcon,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12, // Adjust the font size as needed
                      color: Colors.black,
                      fontFamily: "PaynetM",
                    ),
                  ),
                ),
              ),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.asset("assets/icon/paynetjon_promotion.png",
                        height: 60, width: 72),
                  ),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textNormal(
                          text: "Sizning darajangiz: Tajribali",
                          size: 12,
                          color: LightColors.colorGrey),
                      Row(
                        children: [
                          textBold(
                              text: '3', size: 20, color: LightColors.black),
                          const SizedBox(width: 4),
                          textBold(
                              text: "tanga",
                              size: 16,
                              color: LightColors.colorGreyLight),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.transparent,
                              trackShape: CustomTrackShape(),
                              thumbShape: SliderComponentShape.noThumb),
                          child: Slider(
                            activeColor: LightColors.enableButtonColor,
                            inactiveColor: LightColors.colorGreyLight,
                            value: 0.3,
                            onChanged: (double value) => {},
                          ),
                        ),
                      ),
                      textNormal(
                          text: "397 qoldi keyingi bosqichga",
                          size: 12,
                          color: LightColors.colorGrey),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            _card(
                svgIcon: 'assets/icon/ic_action_plus.svg',
                text:
                    "Oy taklifini faollashtiring va komissiyasiz o'tkazmlar yoki 2.2% gacha keshbek uchun limit oling",
                clickCard: () => {}),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: (true) ? LightColors.enableButtonColor : LightColors.disableButtonColor,
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(child: Text('Taklifni tanlash', style: TextStyle(color: (true) ? Colors.white :LightColors.disableButtonTextColor, fontSize: 16,fontFamily: "PaynetB"))),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
