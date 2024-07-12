part of 'payment_bloc.dart';

class PaymentState {
  bool isShow;

  PaymentState({required this.isShow});

  PaymentState copyWith({bool? isShow}) => PaymentState(isShow: isShow ?? this.isShow);

  factory PaymentState.initial() {
    return PaymentState(isShow: false);
  }
}
