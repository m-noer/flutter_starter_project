import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}
