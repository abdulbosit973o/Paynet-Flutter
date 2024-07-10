import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paynet_app_flutter/core/utils/hive/hive_helper.dart';
import 'package:paynet_app_flutter/features/paynet/data/model/card_model.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc() : super(AddCardInitial()) {
    on<AddCardHiveEvent>((event, emit) {

      print("add card data");
      print(event.cardModel);
      HiveHelper.addCard(event.cardModel);
    });
  }
}
