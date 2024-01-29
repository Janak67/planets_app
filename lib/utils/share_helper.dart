import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  //BookMark
  Future<void> setPlanet(List<String> planetList) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("bookmark", planetList);
  }

  Future<List<String>?> getPlanetData() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("bookmark");
  }

  //Theme
  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }
}
