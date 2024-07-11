import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState.initial()) {
    on<PaymentSearchFocusEvent>((event, emit) {
      emit(state.copyWith(isShow: event.isShow ));
    });
  }
}
