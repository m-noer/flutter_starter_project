import 'package:dio/dio.dart';
import 'package:flutter_starter_project/core/constants/api_path.dart';
import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/domain/auth/entities/entities.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> requestLogin(LoginBody body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<LoginEntity> requestLogin(LoginBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.login,
        data: body.toJson(),
      );

      return LoginModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
