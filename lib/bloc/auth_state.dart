import 'package:submission7/model/user.dart';

enum AuthStates { initial, loading, success, failure }

class AuthState {
  final User? user;
  final AuthStates status;
  final Exception? error;

  AuthState({this.user, this.status = AuthStates.initial, this.error});

  factory AuthState.initial() => AuthState();

  AuthState copyWith({User? user, AuthStates? status, Exception? error}) {
    return AuthState(
      error: error,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
