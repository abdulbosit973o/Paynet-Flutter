import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paynet_app_flutter/core/utils/hive/hive_helper.dart';

import '../../data/model/card_model.dart';

part 'page_main_event.dart';
part 'page_main_state.dart';

class PageMainBloc extends Bloc<PageMainEvent, PageMainState> {
  PageMainBloc() : super(PageMainState(cardList: [])) {
    on<LoadMainScreenEvent>((event, emit) {
      var list = HiveHelper.getAllCard();
      print("card model list");
      print(list);
      emit(PageMainState(cardList: list ?? []));
    });
  }
}
