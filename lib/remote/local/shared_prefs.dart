
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  Future initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // device_token
  String? get deviceToken {
    return _prefs.getString("deviceToken");
  }

  String? get email {
    if (!_prefs.containsKey('email')) return null;
    return _prefs.getString("email");
  }

  String? get password {
    if (!_prefs.containsKey('password')) return null;
    return _prefs.getString("password");
  }

  set deviceToken(String? token) {
    _prefs.setString("deviceToken", token ?? "");
  }

  set password(String? password) {
    _prefs.setString("password", password ?? "");
  }

  set email(String? email) {
    _prefs.setString("email", email ?? "");
  }

  String? get prefixUrl {
    if (!_prefs.containsKey('prefix_url')) return null;
    return _prefs.getString('prefix_url');
  }

  String? get accessToken {
    if (!_prefs.containsKey('access_token')) return null;

    return _prefs.getString('access_token');
  }

  set accessToken(String? token) {
    _prefs.setString("access_token", token ?? "");
  }

  bool get isLogin => accessToken != null;
  //
  // set user(UserModel? user) {
  //   _prefs.setString("user", jsonEncode(user!.toJson()));
  // }
  //
  // UserModel? get user {
  //   try {
  //     if (_prefs.containsKey('user')) {
  //       final json = jsonDecode(_prefs.getString('user')!);
  //       return UserModel.fromJson(json);
  //     } else {
  //       return null;
  //     }
  //   } catch (_) {
  //     return null;
  //   }
  // }

  bool? get firstRun {
    if (!_prefs.containsKey('first_run')) {
      return true;
    }

    return _prefs.getBool('first_run');
  }

  set firstRun(bool? value) {
    _prefs.setBool('first_run', value ?? false);
  }

  set favoriteNews(List<String>? value) {
    _prefs.setStringList('favorite_news', value ?? []);
  }

  List<String>? get favoriteNews {
    if (!_prefs.containsKey('favorite_news')) {
      return null;
    }

    return _prefs.getStringList('favorite_news');
  }

  void removeRemember() {
    _prefs.remove('password');
    _prefs.remove('email');
  }

  void clearData() {
    _prefs.remove('user');
  }

  void removeSeason() {
    _prefs.remove('access_token');
    _prefs.remove('prefix_url');
    _prefs.remove('profile');
  }
}
