import 'package:equatable/equatable.dart';

abstract class PinState extends Equatable {
  const PinState();

  @override
  List<Object> get props => [];
}

class PinInitial extends PinState {}

class PinInput extends PinState {
  final List<int> pin;
  final bool isError;
  final bool isFirstAttempt;

  const PinInput({
    required this.pin,
    required this.isError,
    required this.isFirstAttempt,
  });

  @override
  List<Object> get props => [pin, isError, isFirstAttempt];
}

class PinMatch extends PinState {}

class PinSuccess extends PinState {}

class PinError extends PinState {}
