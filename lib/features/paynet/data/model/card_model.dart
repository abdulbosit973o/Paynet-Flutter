import 'package:hive/hive.dart';
import 'package:paynet_app_flutter/core/utils/status/card_status.dart';

part 'card_model.g.dart';

@HiveType(typeId: 1)
class CardModel extends HiveObject {
  @HiveField(0)
  final String cardNumber;
  @HiveField(1)
  final String cardYear;
  @HiveField(2)
  final String cardStatus;
  @HiveField(3)
  final int cardParse;
  @HiveField(4)
  final int gradientIndex;

  CardModel(this.cardNumber,  this.cardYear,  this.cardStatus,  this.cardParse, this.gradientIndex);
}
