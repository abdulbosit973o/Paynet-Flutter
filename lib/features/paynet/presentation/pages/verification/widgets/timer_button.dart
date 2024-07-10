import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    Key? key,
    required String label,
    required TextAlign textAlign,
    required String disabledLabel,
    required Color color,
    ShapeBorder? shape,
    double? width,
    required int height,
    required int timeOutInSeconds,
    required int elevation,
    BorderRadius? borderRadius,
    required void Function() onPressed,
    required TextStyle disabledTextStyle,
    required TextStyle activeTextStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ctmTimeButtom(
            text: 'Click here',
            disableText: 'Retry in',
            width: double.infinity,
            onPressed: () {},
            time: 180,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      ),
    );
  }

  // custom Timeer button
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