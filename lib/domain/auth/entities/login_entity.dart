import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.data,
    required this.status,
    required this.message,
  });

  final DataLoginEntity data;
  final int status;
  final String message;

  @override
  List<Object?> get props => [data, status, message];
}

class DataLoginEntity extends Equatable {
  const DataLoginEntity({
    required this.token,
  });

  final String token;

  @override
  List<Object> get props => [token];
}
