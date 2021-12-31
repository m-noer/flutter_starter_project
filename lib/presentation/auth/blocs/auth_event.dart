part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  const LoginEvent(this.body);

  final LoginBody body;

  @override
  List<Object?> get props => [body];
}
