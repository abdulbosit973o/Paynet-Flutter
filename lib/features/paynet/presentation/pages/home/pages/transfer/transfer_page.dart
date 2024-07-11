import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynet_app_flutter/core/utils/assets/app_image.dart';
import 'package:paynet_app_flutter/core/utils/component/text_my_font.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/transfer/widgets/common_widget.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/transfer/widgets/international_transfer_widget.dart';

import '../../../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../../../core/utils/formater/card_number_text_input_formater.dart';
import '../../../../../../../core/utils/gradent/card_gradient.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _textCardNumberController = TextEditingController();
  var buttonVisible = false;
  var checkExpiry = true;
  var focusedState = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 2,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        backgroundColor: LightColors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        TextMyFont.textBold(
                          text: "O'tkazmalar",
                          size: 28,
                          color: const Color(0xff1f2025),
                        ),
                        const Spacer(),
                      ],
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      bottom: focusedState ? 0 : -60,
                      right: 0,
                      child: focusedState
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  focusedState = false;
                                  FocusScope.of(context).unfocus();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0.001, 0.001),
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 0.002,
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 8),
                                  child: Text(
                                    'Bekor qilish',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'PaynetB',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: LightColors.inputContainerColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              focusedState = true;
                            });
                          },
                          onChanged: (text) {
                            setState(() {});
                            buttonVisible =
                                (_textCardNumberController.text.length == 19) &&
                                    checkExpiry;
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
                              hintStyle: TextStyle(
                                  fontSize: 18, color: LightColors.colorGrey)),
                          style: const TextStyle(
                              fontSize: 18, fontFamily: "PaynetB"),
                        ),
                      ),
                      if (_textCardNumberController.text.isNotEmpty)
                        GestureDetector(
                            onTap: () {
                              _textCardNumberController.text = "";
                              setState(() {});
                            },
                            child: Icon(Icons.cancel,
                                color: LightColors.colorGrey, size: 18)),
                      if (_textCardNumberController.text.isEmpty)
                        GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(Icons.contacts_outlined,
                                    color: LightColors.colorGrey, size: 24),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.qr_code_scanner,
                                    color: LightColors.colorGrey, size: 24),
                              ],
                            )),
                    ],
                  ),
                ),
                focusedState ? _focusedState() : _noFocusState()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _focusedState() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              TextMyFont.textBold(
                  text: "So'nggi", size: 16, color: LightColors.black),
              const Spacer(),
              TextMyFont.textBold(
                  text: "Tozalash", size: 16, color: LightColors.colorGrey),
              const Icon(Icons.delete_rounded)
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0.0001, 0.0001),
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 0.002),
                  ],
                  color: Colors.white),
              child: ListTile(
                title: TextMyFont.textBold(
                    text: "8600 31** **** 4563",
                    size: 16,
                    color: LightColors.black),
                subtitle: TextMyFont.textNormal(
                    text: "G'aniyev Muhammadrizo",
                    size: 14,
                    color: LightColors.colorGrey),
                leading: Container(
                  width: 64,
                  height: 42,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      gradient: index <= 8
                          ? CardGradient.gradient[index]
                          : CardGradient.gradient[5],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(''),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8,
            );
          },
        )
      ],
    );
  }

  Widget _noFocusState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 124,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(AppImage.logo),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "G'aniyev\nMuhammad",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PaynetB',
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: 10),
        ),
        Row(
          children: [
            Expanded(
              child: CustomCard(
                title: "O'zimning kartamga",
                subtitle: '',
                backgroundColor: const Color(0xFFffdff4),
                imagePath: AppImage.toRussia,
                // Replace with your image path
                onTap: () {
                  print("O'zimning kartamga tapped");
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomCard(
                title: 'Paynet-kartamga',
                subtitle: '',
                backgroundColor: const Color(0xFFacffe3),
                imagePath: AppImage.toRussia,
                // Replace with your image path
                onTap: () {
                  print('Paynet-kartamga tapped');
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Shablonlar',
          style: TextStyle(
            fontFamily: 'PaynetB',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: LightColors.inputContainerColor, shape: BoxShape.circle),
          child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: LightColors.colorGrey, shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                color: LightColors.white,
              )),
        ),
        const Text(
          'Qo’shish',
          style: TextStyle(
            fontFamily: 'PaynetB',
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Xalqaro o\'tkazmalar',
          style: TextStyle(
            fontFamily: 'PaynetB',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: InternationalTransfer(
                title: 'Rossiyaga',
                backgroundColor: const Color(0xFFd3f3fe),
                imagePath: AppImage.toRussia,
                // Replace with your image path
                onTap: () {
                  print('Rossiyaga tapped');
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InternationalTransfer(
                title: 'O\'zbekistonga',
                backgroundColor: const Color(0xFFf3effe),
                imagePath: AppImage.toUzbekistan,
                // Replace with your image path
                onTap: () {
                  print('O\'zbekistonga tapped');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
