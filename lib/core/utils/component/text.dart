import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';

Widget textBold({required String text, required double size, required Color color}) {
  return Text(text, style: TextStyle(fontSize: size, color: color, fontFamily: "PaynetB"));
}

Widget textAlign({required String text, required double size, required Color color, required TextAlign align}) {
  return Text(text, style: TextStyle(fontSize: size, color: color, fontFamily: "PaynetB"), textAlign: align);
}

Widget textNormal({required String text, required double size, required Color color}) {
  return Text(text, style: TextStyle(fontSize: size, color: color, fontFamily: "PaynetM"));
}

Widget linkText({required String text, required double size, required Color color, required String url}) {
  return LinkText(
    text,
    textStyle: TextStyle(fontSize: size, color: color,fontFamily: "PaynetM"),
    onLinkTap: (url) {},
  );
}
