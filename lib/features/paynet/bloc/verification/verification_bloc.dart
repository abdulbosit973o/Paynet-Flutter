import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(VerificationInitial()) {
    on<VerificationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
