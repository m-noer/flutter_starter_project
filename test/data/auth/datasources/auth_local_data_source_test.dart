import 'package:flutter_starter_project/core/constants/key_constants.dart';
import 'package:flutter_starter_project/core/utils/services/shared_prefs.dart';
import 'package:flutter_starter_project/data/auth/datasources/auth_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPrefs sharedPrefs;
  late AuthLocalDataSourceImpl localData;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});

    sharedPrefs = await SharedPrefs.getInstance();
    localData = AuthLocalDataSourceImpl(sharedPrefs);
  });

  group('AuthLocalDataSource', () {
    test('should return login model', () async {
      await localData.saveToken('token');

      expect(sharedPrefs.isKeyExists(KeyConstants.keyAccessToken), true);
    });
  });
}
