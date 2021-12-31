import 'package:flutter_starter_project/domain/auth/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel({
    required DataLoginModel data,
    required int status,
    required String message,
  }) : super(
          data: data,
          status: status,
          message: message,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataLoginModel extends DataLoginEntity {
  const DataLoginModel({required String token}) : super(token: token);

  factory DataLoginModel.fromJson(Map<String, dynamic> json) =>
      _$DataLoginModelFromJson(json);
}
