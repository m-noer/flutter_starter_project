// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      data: DataLoginModel.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      message: json['message'] as String,
    );

DataLoginModel _$DataLoginModelFromJson(Map<String, dynamic> json) =>
    DataLoginModel(
      token: json['token'] as String,
    );
