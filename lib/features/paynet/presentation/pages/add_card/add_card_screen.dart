import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynet_app_flutter/core/utils/colors/lingth_colors.dart';
import 'package:paynet_app_flutter/core/utils/component/text_my_font.dart';
import 'package:paynet_app_flutter/core/utils/formater/card_check/check_expiry.dart';
import 'package:paynet_app_flutter/core/utils/formater/card_number_text_input_formater.dart';
import 'package:paynet_app_flutter/features/paynet/bloc/add_card/add_card_bloc.dart';
import 'package:paynet_app_flutter/features/paynet/bloc/page_main/page_main_bloc.dart';
import 'package:paynet_app_flutter/features/paynet/data/model/card_model.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/add_card/widget/bottom_button.dart';

import '../../../../../core/utils/formater/card_check/card_check_status.dart';
import '../../../../../core/utils/formater/card_expiry_data_text_input_formater.dart';
import '../../../../../core/utils/gradent/card_gradient.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _textCardNumberController = TextEditingController();
  final _textCardYearController = TextEditingController();
  var buttonVisible = false;
  var checkExpiry = true;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: LightColors.mainBackgroundColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: LightColors.colorGrey)),
        title: TextMyFont.textBold(text: "Kartani qo'shish", size: 24, color: LightColors.black),
      ),
      body: BlocConsumer<AddCardBloc, AddCardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                width: double.infinity,
                height: 210,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: CardGradient.gradient[0]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: LightColors.inputContainerColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (text) {
                                setState(() {});
                                buttonVisible =
                                    (_textCardYearController.text.length == 5) && (_textCardNumberController.text.length == 19) && checkExpiry;
                              },
                              controller: _textCardNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                FilteringTextInputFormatter.digitsOnly,
                                CardNumberTextInputFormatter(),
                              ],
                              maxLength: 19,
                              decoration: InputDecoration(
                                  counterText: "",
                                  hintText: "Karta raqami",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 18, color: LightColors.colorGrey)),
                              style: const TextStyle(fontSize: 18, fontFamily: "PaynetB"),
                            ),
                          ),
                          if (_textCardNumberController.text.isNotEmpty)
                            GestureDetector(
                                onTap: () {
                                  _textCardNumberController.text = "";
                                  setState(() {});
                                },
                                child: Icon(Icons.cancel, color: LightColors.colorGrey, size: 18)),
                          if (_textCardNumberController.text.isEmpty)
                            GestureDetector(onTap: () {}, child: Icon(Icons.qr_code_scanner, color: LightColors.colorGrey, size: 24)),
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: LightColors.inputContainerColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (text) {
                                setState(() {});

                                if (text.length == 5) {
                                  checkExpiry = CheckExpiry.checkExpirationDateValidation(text);
                                  print(checkExpiry);
                                } else {
                                  checkExpiry = true;
                                }
                                buttonVisible =
                                    (_textCardYearController.text.length == 5) && (_textCardNumberController.text.length == 19) && checkExpiry;
                              },
                              controller: _textCardYearController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                FilteringTextInputFormatter.digitsOnly,
                                CardExpiryDateTextInputFormatter(),
                              ],
                              maxLength: 5,
                              decoration: InputDecoration(
                                  counterText: "",
                                  hintText: "oo/yy",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 18, color: LightColors.colorGrey)),
                              style: TextStyle(fontSize: 18, fontFamily: "PaynetB", color: (checkExpiry) ? LightColors.black : Colors.red),
                            ),
                          ),
                          if (_textCardYearController.text.isNotEmpty)
                            GestureDetector(
                                onTap: () {
                                  _textCardYearController.text = "";
                                  setState(() {});
                                },
                                child: Icon(Icons.cancel, color: LightColors.colorGrey, size: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              BottomButton(
                  clickButton: () {
                    final a = CardCheckStatus.detectCardType(_textCardNumberController.text);
                    var cardModel = CardModel(_textCardNumberController.text, _textCardYearController.text,
                        CardCheckStatus.detectCardType(_textCardNumberController.text).name, 10000000, 0);
                    context.read<AddCardBloc>().add(AddCardHiveEvent(cardModel: cardModel));

                    Navigator.pop(context, true);
                  },
                  buttonVisible: buttonVisible,
                  buttonText: "Davom etish")
            ],
          );
        },
      ),
    );
  }
}
