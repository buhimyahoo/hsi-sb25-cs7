import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission7/bloc/auth_event.dart';
import 'package:submission7/bloc/auth_state.dart';
import 'package:submission7/service/user_local_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<RegisterAuthEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStates.loading));

        final user = await UserLocalService.register(
          name: event.name,
          email: event.email,
          password: event.password,
        );

        emit(state.copyWith(status: AuthStates.success, user: user));
      } on Exception catch (e) {
        emit(state.copyWith(status: AuthStates.failure, error: e));
      }
    });
  }
}
