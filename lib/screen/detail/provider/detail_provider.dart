import 'package:flutter/material.dart';
import 'package:planets_app/utils/share_helper.dart';

class DetailProvider with ChangeNotifier {
  //Theme
  bool isLight = true;

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}
