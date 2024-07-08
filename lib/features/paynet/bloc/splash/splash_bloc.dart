import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/splash/splash_status.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashEvent>((event, emit) {
      Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(SplashStatus.login));
    });
  }
}
