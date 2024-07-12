import 'package:bloc/bloc.dart';
import 'package:paynet_app_flutter/core/utils/hive/hive_helper.dart';

import '../../../../core/utils/status/status.dart';
import '../../data/model/card_model.dart';

part 'all_card_event.dart';

part 'all_card_state.dart';

class AllCardBloc extends Bloc<LoadAllCardEvent, AllCardState> {
  AllCardBloc() : super(AllCardState(status: Status.loading)) {
    on<LoadAllCardEvent>((event, emit) {
      try {
        emit(state.copyWith(status: Status.loading));
        var cardList = HiveHelper.getAllCard();
        print("card length $cardList");
        emit(state.copyWith(cardList: cardList, status: Status.success));
      } catch (e) {
        emit(state.copyWith(cardList: [], errorMessage: e.toString(), status: Status.fail));
      }
    });
  }
}
