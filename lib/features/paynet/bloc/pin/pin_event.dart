import 'package:equatable/equatable.dart';

abstract class PinEvent extends Equatable {
  const PinEvent();

  @override
  List<Object> get props => [];
}

class NumberButtonPressed extends PinEvent {
  final int number;

  const NumberButtonPressed(this.number);

  @override
  List<Object> get props => [number];
}

class DeleteButtonPressed extends PinEvent {}

class ResetPin extends PinEvent {}