part of 'payment_bloc.dart';

class PaymentEvent {}

class PaymentSearchFocusEvent extends PaymentEvent{
  bool isShow;
  PaymentSearchFocusEvent({required this.isShow});
}
