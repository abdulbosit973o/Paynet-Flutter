import 'package:intl/intl.dart';

class CheckExpiry {
  static bool checkExpirationDateValidation(String expirationDate) {
    try {
      if (expirationDate.length != 5) return false;

      int month = int.parse(expirationDate.substring(0, 2));
      int year = int.parse(expirationDate.substring(3, 5));

      if (month < 1 || month > 12) return false;

      final currentDate = DateTime.now();
      final currentMonth = currentDate.month;
      final currentYear = currentDate.year % 100; // Last two digits of the current year

      final userDate = DateTime(2000 + year, month); // 2000 + year, because we are dealing with two digits

      return userDate.isAfter(currentDate) ||
          (userDate.year == currentDate.year && userDate.month >= currentDate.month);
    } catch (e) {
      return false;
    }
  }
}
