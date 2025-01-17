import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/widgets/custom_navigation.dart';

import '../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../core/utils/component/continue_button.dart';
import '../../../../../core/utils/component/text_my_font.dart';
import '../../../../../core/utils/formater/phone_number_text_input_formater.dart';
import '../verification/verification_screen.dart';
import 'login_bottom_sheet_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return loginBottomSheetDialog(
                              clickRu: () {},
                              clickCancel: () {
                                Navigator.pop(context);
                              },
                              clickUz: () {},
                              uzAndRuLanguage: true);
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: LightColors.inputContainerColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      margin: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Til", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: LightColors.inputContainerColor,
                              ),
                              child: Image.asset(
                                "assets/icon/uz.png",
                                height: 28,
                                width: 36,
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.asset("assets/icon/image_crickle_green.jpg", height: 60, width: 60)),
              TextMyFont.textBold(text: "Raqamingizni kiriting", size: 24, color: Colors.black),
              TextMyFont.textNormal(text: "Mijoz bo'lish yoki kirish uchun", size: 14, color: Colors.black54),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: LightColors.inputContainerColor,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: LightColors.inputContainerColor,
                      ),
                      child: Image.asset(
                        "assets/icon/uz.png",
                        height: 28,
                        width: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black45),
                    TextMyFont.textBold(text: "+998 ", size: 18, color: Colors.black),
                    Expanded(
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        autofocus: true,
                        controller: _textNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly,
                          PhoneNumberTextInputFormatter(),
                        ],
                        maxLength: 12,
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 18, fontFamily: "PaynetB"),
                      ),
                    ),
                    if (_textNumberController.text.isNotEmpty)
                      GestureDetector(
                          onTap: () {
                            _textNumberController.text = "";
                            setState(() {});
                          },
                          child: const Icon(Icons.cancel, color: Colors.black38, size: 28)),
                  ],
                ),
              ),
              const Spacer(),
              continueButton(
                  clickButton: () {
                    if (_textNumberController.text.length == 12) {
                      CustomNavigation.push(context, const VerificationScreen());
                    }
                  },
                  disableAndEnable: _textNumberController.text.length == 12,
                  buttonText: "Davom etish"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Column(
                  children: [
                    TextMyFont.textNormal(text: '"Davom etish" tugamsini bosish orqali men', size: 14, color: Colors.black54),
                    TextMyFont.linkText(text: "Xizmatlar ko'rsatish haqidagi oferta shartlarini", size: 14, color: Colors.blueAccent, url: ""),
                    TextMyFont.textAlign(
                        text: "qabul qilaman va shaxsiy malumotlarni qayta ishlashga rozilik bildiraman",
                        size: 14,
                        color: Colors.black54,
                        align: TextAlign.center)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
