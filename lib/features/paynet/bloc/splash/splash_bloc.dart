import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:paynet_app_flutter/core/utils/constants/constans.dart';
import 'package:paynet_app_flutter/core/utils/hive/hive_helper.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/splash/splash_status.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashEvent>((event, emit) async {
      Future.delayed(const Duration(seconds: 10));
      dynamic isVerified = await HiveHelper.getData(Constants.isVerified);
      if(isVerified.runtimeType == bool) {
        bool isVerify = isVerified as bool;
        if (isVerify) {
          emit(state.copyWith(SplashStatus.pinCode));
        }
        else {
          emit(state.copyWith(SplashStatus.login));
        }
      }
      else  {
        emit(state.copyWith(SplashStatus.login));
      }
    });
  }
}
