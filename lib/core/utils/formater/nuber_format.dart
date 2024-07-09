String formatInt(int value) {
  String valueStr = value.toString();
  StringBuffer buffer = StringBuffer();

  for (int i = 0; i < valueStr.length; i++) {
    if (i > 0 && (valueStr.length - i) % 3 == 0) {
      buffer.write(' ');
    }
    buffer.write(valueStr[i]);
  }

  return buffer.toString();
}