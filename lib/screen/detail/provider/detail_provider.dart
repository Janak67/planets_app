import 'package:flutter/material.dart';
import 'package:planets_app/screen/home/model/home_model.dart';
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

  //BookMark
  List<String> bookMarkPlanet = [];

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    List<String>? book = await shareHelper.getPlanetData();
    if (book != null) {
      bookMarkPlanet = book;
    }
    notifyListeners();
  }

  HomeModel? h1;

  void addBookMark() {
    ShareHelper shareHelper = ShareHelper();
    bookMarkPlanet.add(h1!.name!);
    shareHelper.setPlanet(bookMarkPlanet);
    notifyListeners();
  }

  void deleteBookMark() {
    ShareHelper shareHelper = ShareHelper();
    bookMarkPlanet.remove;
    shareHelper.setPlanet(bookMarkPlanet);
    notifyListeners();
  }
}
