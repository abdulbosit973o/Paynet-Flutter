import 'package:paynet_app_flutter/core/utils/status/card_status.dart';

class CardCheckStatus{
 static CardStatus detectCardType(String cardNumber) {
    // Kartani dastlabki 6 raqamni olish
    String bin = cardNumber.substring(0, 6);

    // Uzcard BINlari
    List<String> uzcardBins = [
      '8600', // Uzcard boshlanishi uchun misol
    ];

    // Humo BINlari
    List<String> humoBins = [
      '9860', // Humo boshlanishi uchun misol
    ];

    // Mir BINlari
    List<String> mirBins = [
      '2200', // Mir boshlanishi uchun misol
    ];

    // Visa BINlari
    List<String> visaBins = [
      '4', // Visa boshlanishi 4 bilan
    ];

    // Mastercard BINlari
    List<String> mastercardBins = [
      '51', '52', '53', '54', '55', // Mastercard boshlanishi 51-55 bilan
    ];

    // Karta turini aniqlash
    if (uzcardBins.any((prefix) => bin.startsWith(prefix))) {
      return CardStatus.uzcard;
    } else if (humoBins.any((prefix) => bin.startsWith(prefix))) {
      return CardStatus.humo;
    } else if (mirBins.any((prefix) => bin.startsWith(prefix))) {
      return CardStatus.mir;
    } else if (visaBins.any((prefix) => bin.startsWith(prefix))) {
      return CardStatus.visa;
    } else if (mastercardBins.any((prefix) => bin.startsWith(prefix))) {
      return CardStatus.mastercard;
    } else {
      return CardStatus.unknown;
    }
  }

}