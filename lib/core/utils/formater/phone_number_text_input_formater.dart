import 'package:flutter/services.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.isEmpty) {
      return newValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2 || i == 5 || i == 7) buffer.write(' ');
      buffer.write(text[i]);
    }

    final String newText = buffer.toString();
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
