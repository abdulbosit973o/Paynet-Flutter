part of 'splash_bloc.dart';

class SplashState {
  final SplashStatus? status;

  SplashState({this.status});

  SplashState copyWith(
    final SplashStatus? status,
  ) =>
      SplashState(status: status ?? this.status);
}
