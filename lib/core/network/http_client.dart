import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_starter_project/core/constants/key_constants.dart';
import 'package:flutter_starter_project/core/env/env_config.dart';
import 'package:flutter_starter_project/core/utils/services/shared_prefs.dart';

class HttpClient {
  HttpClient({required this.config, required this.preferences});

  late EnvConfig config;
  late SharedPrefs preferences;

  Dio get dio => _getDio();

  Dio _getDio() {
    final header = <String, dynamic>{
      'isToken': preferences.isKeyExists(KeyConstants.keyAccessToken)
    };

    final options = BaseOptions(
      baseUrl: config.apiBaseUrl ?? '',
      connectTimeout: 20000,
      receiveTimeout: 20000,
      receiveDataWhenStatusError: true,
      headers: header,
    );

    final dio = Dio(options);

    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      final storageToken = preferences.getString('isToken');
      final headers = {'Authorization': 'Bearer $storageToken'};

      log("--> ${options.method} ${"${options.baseUrl}${options.path}"}");
      log('Headers:');
      options.headers.forEach((k, dynamic v) => log('$k: $v'));
      log('queryParameters:');
      options.queryParameters.forEach((k, dynamic v) => log('$k: $v'));
      log(
        '--> END ${options.method}',
      );

      if (options.headers.containsKey('isToken')) {
        options.headers.remove('isToken');
        options.headers.addAll(headers);
      }

      // Do something before request is sent
      log('\n'
          '-- headers --\n'
          '${options.headers.toString()} \n'
          '-- request -- \n -->body '
          '${options.data} \n'
          '');

      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (response, handler) {
      // Do something with response data
      log('\n'
          'Response : ${response.requestOptions.uri} \n'
          '-- headers --\n'
          '${response.headers.toString()} \n'
          '-- response --\n'
          '${jsonEncode(response.data)} \n'
          '');

      return handler.next(response); // continue
    }, onError: (error, handler) {
      // Do something with response error
      return handler.next(error); //continue
    });
  }
}
