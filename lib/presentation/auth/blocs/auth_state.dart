part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  const AuthFailure({
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  @override
  List<Object> get props => [];
}
