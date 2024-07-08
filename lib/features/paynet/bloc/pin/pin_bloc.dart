import 'package:bloc/bloc.dart';
import 'package:paynet_app_flutter/core/utils/constants/constans.dart';
import 'package:paynet_app_flutter/core/utils/hive/hive_helper.dart';
import 'package:paynet_app_flutter/features/paynet/bloc/pin/pin_event.dart';
import 'package:paynet_app_flutter/features/paynet/bloc/pin/pin_state.dart';

import '../../presentation/pages/home/home_screen.dart';
import '../../presentation/widgets/custom_navigation.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  List<int> firstPin = [];
  bool isFirstAttempt = true;

  PinBloc() : super(PinInitial()) {
    on<NumberButtonPressed>(_onNumberButtonPressed);
    on<DeleteButtonPressed>(_onDeleteButtonPressed);
    on<ResetPin>(_onResetPin);
    on<NavigateNext>(_onNavigateNext);
  }

  void _onNumberButtonPressed(NumberButtonPressed event, Emitter<PinState> emit) {
    if (state is PinInput) {
      final currentState = state as PinInput;
      final updatedPin = List<int>.from(currentState.pin)..add(event.number);

      if (updatedPin.length == 4) {
        if (isFirstAttempt) {
          firstPin = List.from(updatedPin);
          isFirstAttempt = false;
          emit(const PinInput(pin: [], isError: false, isFirstAttempt: false));
        } else {
          if (updatedPin.toString() == firstPin.toString()) {
            emit(PinMatch());
          } else {
            emit(PinError());
            emit(const PinInput(pin: [], isError: true, isFirstAttempt: false));
          }
        }
      } else {
        emit(PinInput(pin: updatedPin, isError: false, isFirstAttempt: currentState.isFirstAttempt));
      }
    } else {
      emit(PinInput(pin: [event.number], isError: false, isFirstAttempt: isFirstAttempt));
    }
  }

  void _onDeleteButtonPressed(DeleteButtonPressed event, Emitter<PinState> emit) {
    if (state is PinInput) {
      final currentState = state as PinInput;
      if (currentState.pin.isNotEmpty) {
        final updatedPin = List<int>.from(currentState.pin)..removeLast();
        emit(PinInput(pin: updatedPin, isError: false, isFirstAttempt: currentState.isFirstAttempt));
      }
    }
  }

  void _onResetPin(ResetPin event, Emitter<PinState> emit) {
    emit(const PinInput(pin: [], isError: false, isFirstAttempt: true));
    firstPin = [];
    isFirstAttempt = true;
  }
  void _onNavigateNext(NavigateNext event, Emitter<PinState> emit) async{
    await HiveHelper.putData(Constants.password, firstPin.join());
    await HiveHelper.putData(Constants.isVerified, true);
    print("_____________________________________________________________ ${firstPin.join()}");
    emit(PinSuccess());
  }
}
