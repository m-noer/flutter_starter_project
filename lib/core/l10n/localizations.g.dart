// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'id'): const AppLocalizationsData(
    homeCourse: 'Home Course',
    onlineCourse: 'Kelas Online',
    newEvents: 'Event Terbaru',
    noDataFound: 'Tidak Ada Data',
    profile: 'Profil',
    notification: 'Notifikasi',
    course: 'Kelas',
    cart: 'Keranjang',
    home: 'Home',
    seeAll: 'Lihat semua',
    state: const AppLocalizationsDataState(
      loading: 'Proses',
      success: 'Sukses',
      failure: 'Gagal',
    ),
    form: const AppLocalizationsDataForm(
      password: 'Password',
      username: 'Username',
      required: const AppLocalizationsDataFormRequired(
        password: 'Tolong masukkan password',
        username: 'Tolong masukkan username',
      ),
    ),
    auth: const AppLocalizationsDataAuth(
      register: 'Daftar',
      logout: 'Keluar',
      login: 'Masuk',
    ),
  ),
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    homeCourse: 'Home Course',
    onlineCourse: 'Online Course',
    newEvents: 'New Events',
    noDataFound: 'No Data Found',
    profile: 'Profile',
    notification: 'Notification',
    course: 'Class',
    cart: 'Cart',
    home: 'Home',
    seeAll: 'See all',
    state: const AppLocalizationsDataState(
      loading: 'Loading',
      success: 'Success',
      failure: 'Failure',
    ),
    form: const AppLocalizationsDataForm(
      password: 'Password',
      username: 'Username',
      required: const AppLocalizationsDataFormRequired(
        password: 'Please enter a password',
        username: 'Please enter the username',
      ),
    ),
    auth: const AppLocalizationsDataAuth(
      register: 'Register',
      logout: 'Logout',
      login: 'Login',
    ),
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.homeCourse,
    required this.onlineCourse,
    required this.newEvents,
    required this.noDataFound,
    required this.profile,
    required this.notification,
    required this.course,
    required this.cart,
    required this.home,
    required this.seeAll,
    required this.state,
    required this.form,
    required this.auth,
  });

  final String homeCourse;
  final String onlineCourse;
  final String newEvents;
  final String noDataFound;
  final String profile;
  final String notification;
  final String course;
  final String cart;
  final String home;
  final String seeAll;
  final AppLocalizationsDataState state;
  final AppLocalizationsDataForm form;
  final AppLocalizationsDataAuth auth;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        homeCourse: map['homeCourse']! as String,
        onlineCourse: map['onlineCourse']! as String,
        newEvents: map['newEvents']! as String,
        noDataFound: map['noDataFound']! as String,
        profile: map['profile']! as String,
        notification: map['notification']! as String,
        course: map['course']! as String,
        cart: map['cart']! as String,
        home: map['home']! as String,
        seeAll: map['seeAll']! as String,
        state: AppLocalizationsDataState.fromJson(
            map['state']! as Map<String, Object?>),
        form: AppLocalizationsDataForm.fromJson(
            map['form']! as Map<String, Object?>),
        auth: AppLocalizationsDataAuth.fromJson(
            map['auth']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    String? homeCourse,
    String? onlineCourse,
    String? newEvents,
    String? noDataFound,
    String? profile,
    String? notification,
    String? course,
    String? cart,
    String? home,
    String? seeAll,
    AppLocalizationsDataState? state,
    AppLocalizationsDataForm? form,
    AppLocalizationsDataAuth? auth,
  }) =>
      AppLocalizationsData(
        homeCourse: homeCourse ?? this.homeCourse,
        onlineCourse: onlineCourse ?? this.onlineCourse,
        newEvents: newEvents ?? this.newEvents,
        noDataFound: noDataFound ?? this.noDataFound,
        profile: profile ?? this.profile,
        notification: notification ?? this.notification,
        course: course ?? this.course,
        cart: cart ?? this.cart,
        home: home ?? this.home,
        seeAll: seeAll ?? this.seeAll,
        state: state ?? this.state,
        form: form ?? this.form,
        auth: auth ?? this.auth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData &&
          homeCourse == other.homeCourse &&
          onlineCourse == other.onlineCourse &&
          newEvents == other.newEvents &&
          noDataFound == other.noDataFound &&
          profile == other.profile &&
          notification == other.notification &&
          course == other.course &&
          cart == other.cart &&
          home == other.home &&
          seeAll == other.seeAll &&
          state == other.state &&
          form == other.form &&
          auth == other.auth);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      homeCourse.hashCode ^
      onlineCourse.hashCode ^
      newEvents.hashCode ^
      noDataFound.hashCode ^
      profile.hashCode ^
      notification.hashCode ^
      course.hashCode ^
      cart.hashCode ^
      home.hashCode ^
      seeAll.hashCode ^
      state.hashCode ^
      form.hashCode ^
      auth.hashCode;
}

class AppLocalizationsDataState {
  const AppLocalizationsDataState({
    required this.loading,
    required this.success,
    required this.failure,
  });

  final String loading;
  final String success;
  final String failure;
  factory AppLocalizationsDataState.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataState(
        loading: map['loading']! as String,
        success: map['success']! as String,
        failure: map['failure']! as String,
      );

  AppLocalizationsDataState copyWith({
    String? loading,
    String? success,
    String? failure,
  }) =>
      AppLocalizationsDataState(
        loading: loading ?? this.loading,
        success: success ?? this.success,
        failure: failure ?? this.failure,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataState &&
          loading == other.loading &&
          success == other.success &&
          failure == other.failure);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      loading.hashCode ^
      success.hashCode ^
      failure.hashCode;
}

class AppLocalizationsDataForm {
  const AppLocalizationsDataForm({
    required this.password,
    required this.username,
    required this.required,
  });

  final String password;
  final String username;
  final AppLocalizationsDataFormRequired required;
  factory AppLocalizationsDataForm.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataForm(
        password: map['password']! as String,
        username: map['username']! as String,
        required: AppLocalizationsDataFormRequired.fromJson(
            map['required']! as Map<String, Object?>),
      );

  AppLocalizationsDataForm copyWith({
    String? password,
    String? username,
    AppLocalizationsDataFormRequired? required,
  }) =>
      AppLocalizationsDataForm(
        password: password ?? this.password,
        username: username ?? this.username,
        required: required ?? this.required,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataForm &&
          password == other.password &&
          username == other.username &&
          required == other.required);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      password.hashCode ^
      username.hashCode ^
      required.hashCode;
}

class AppLocalizationsDataFormRequired {
  const AppLocalizationsDataFormRequired({
    required this.password,
    required this.username,
  });

  final String password;
  final String username;
  factory AppLocalizationsDataFormRequired.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataFormRequired(
        password: map['password']! as String,
        username: map['username']! as String,
      );

  AppLocalizationsDataFormRequired copyWith({
    String? password,
    String? username,
  }) =>
      AppLocalizationsDataFormRequired(
        password: password ?? this.password,
        username: username ?? this.username,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataFormRequired &&
          password == other.password &&
          username == other.username);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ password.hashCode ^ username.hashCode;
}

class AppLocalizationsDataAuth {
  const AppLocalizationsDataAuth({
    required this.register,
    required this.logout,
    required this.login,
  });

  final String register;
  final String logout;
  final String login;
  factory AppLocalizationsDataAuth.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataAuth(
        register: map['register']! as String,
        logout: map['logout']! as String,
        login: map['login']! as String,
      );

  AppLocalizationsDataAuth copyWith({
    String? register,
    String? logout,
    String? login,
  }) =>
      AppLocalizationsDataAuth(
        register: register ?? this.register,
        logout: logout ?? this.logout,
        login: login ?? this.login,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataAuth &&
          register == other.register &&
          logout == other.logout &&
          login == other.login);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      register.hashCode ^
      logout.hashCode ^
      login.hashCode;
}
