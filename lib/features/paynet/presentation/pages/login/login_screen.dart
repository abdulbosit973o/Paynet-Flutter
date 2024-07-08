import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynet_app_flutter/core/utils/colors/app_color.dart';
import 'package:paynet_app_flutter/core/utils/component/text.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/home_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/pin_code_creator/pin_create_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/verification/verification_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/widgets/custom_navigation.dart';

import '../../../../../core/utils/component/continue_button.dart';
import '../../../../../core/utils/formater/phone_number_text_input_formater.dart';
import '../verification/verification_screen.dart';

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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: inputContainerColor,
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
                              color: inputContainerColor,
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
                ],
              ),
              const SizedBox(height: 16),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.asset("assets/icon/image_crickle_green.jpg", height: 60, width: 60)),
              textBold(text: "Raqamingizni kiriting", size: 24, color: Colors.black),
              textNormal(text: "Mijoz bo'lish yoki kirish uchun", size: 14, color: Colors.black54),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: inputContainerColor,
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
                        color: inputContainerColor,
                      ),
                      child: Image.asset(
                        "assets/icon/uz.png",
                        height: 28,
                        width: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black45),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: textBold(text: "+998 ", size: 18, color: Colors.black),
                    ),
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
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationScreen()));
                  },
                  disableAndEnable: _textNumberController.text.length == 12,
                  buttonText: "Davom etish"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Column(
                  children: [
                    textNormal(text: '"Davom etish" tugamsini bosish orqali men', size: 14, color: Colors.black54),
                    linkText(text: "Xizmatlar ko'rsatish haqidagi oferta shartlarini", size: 14, color: Colors.blueAccent, url: ""),
                    textAlign(
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
