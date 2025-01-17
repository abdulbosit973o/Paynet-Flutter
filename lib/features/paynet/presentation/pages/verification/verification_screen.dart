import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/verification/widgets/timer_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/custom_navigation.dart';
import '../pin_code_creator/pin_create_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({
    super.key,
    this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset('assets/icon/image_crickle_green.jpg'),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  'SMSdagi kodni kiriting',
                  style: TextStyle(
                      fontFamily: "PaynetB",
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 2),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "+998 ${widget.phoneNumber}",
                        style: const TextStyle(
                          fontFamily: "PaynetB",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const TextSpan(
                        text: " raqamiga yubordik",
                        style: TextStyle(
                          fontFamily: "PaynetB",
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                    style: const TextStyle(
                      fontFamily: "PaynetB",
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 36,
                  ),
                  child: PinCodeTextField(
                    appContext: context,

                    pastedTextStyle: TextStyle(
                      fontFamily: "PaynetB",
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: false,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(16),
                      fieldHeight: 55,
                      fieldWidth: 45,

                      inactiveFillColor: const Color(0xffecedef),
                      activeColor: const Color(0xffecedef),
                      selectedFillColor: const Color(0xffecedef),
                      inactiveColor: const Color(0xffecedef),

                      activeFillColor: const Color(0xffecedef),
                      selectedColor: const Color(0xffecedef),
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: Text(
                    hasError ? "Noto\'g\'ri kod" : "",
                    style: const TextStyle(
                      fontFamily: "PaynetB",
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: const Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: const Offset(-1, 2),
                          blurRadius: 5)
                    ]),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      if (currentText.length != 6 || currentText != "123456") {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                          () {
                            hasError = false;
                            CustomNavigation.push(
                                context, const PinCreateScreen());
                            snackBar("OTP Verified!!");
                          },
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        "VERIFY".toUpperCase(),
                        style: const TextStyle(
                          fontFamily: "PaynetB",
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Center(
              //   child: ctmTimeButtom(
              //       text: 'Click here',
              //       disableText: 'Retry in',
              //       width: double.infinity,
              //       onPressed: () {},
              //       time: 180,
              //       shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(20),
              //               bottomLeft: Radius.circular(20))),
              //       borderRadius: const BorderRadius.only(
              //           topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ctmTimeButtom({
    required final String text,
    required final String disableText,
    final Color? color,
    required void Function() onPressed,
    final BorderRadius? borderRadius,
    final double? width,
    final ShapeBorder? shape,
    final double? elevation,
    int? time,
  }) {
    return TimerButton(
      label: text,
      textAlign: TextAlign.center,
      disabledLabel: disableText,
      color: color ?? Colors.red,
      shape: shape,
      width: width,
      height: 55,
      timeOutInSeconds: time ?? 5,
      elevation: 18,
      borderRadius: borderRadius,
      onPressed: onPressed,
      disabledTextStyle: const TextStyle(
        fontSize: 17,
        color: Colors.black38,
        fontWeight: FontWeight.bold,
      ),
      activeTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
