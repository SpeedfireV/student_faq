import 'package:shared_preferences/shared_preferences.dart';

enum LocalUserData { isUserIntroduced }

class UserDataService {
  Future<bool?> isUserIntroduced() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LocalUserData.isUserIntroduced.name);
  }

  Future<void> setUserIntroduced() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LocalUserData.isUserIntroduced.name, true);
  }
}
