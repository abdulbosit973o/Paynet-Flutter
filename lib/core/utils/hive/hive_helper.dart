import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../features/paynet/data/model/card_model.dart';

class HiveHelper {
  static const String boxName = 'user_datas';
  static const String boxCardName = 'CARD_DATA';
  static late final Box<CardModel> boxCard;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);

    Hive.registerAdapter(CardModelAdapter());
    boxCard = await Hive.openBox<CardModel>(boxCardName);
  }

  static Future<void> putData(String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  static Future<dynamic> getData(String key) async {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  static void addCard(CardModel cardData) {
    boxCard.put(cardData.cardNumber, cardData);
  }

  static List<CardModel> getAllCard() {
    return boxCard.values.toList();
  }
}
