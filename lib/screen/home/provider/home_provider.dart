import 'package:flutter/material.dart';
import 'package:planets_app/screen/home/model/home_model.dart';
import 'package:planets_app/utils/json_helper.dart';
import 'package:planets_app/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  // Json
  List<HomeModel> planet = [];

  Future<void> getData() async {
    JsonHelper jsonHelper = JsonHelper();
    List<HomeModel> l1 = await jsonHelper.planetJson();
    planet = l1;
    notifyListeners();
  }

  //Animation
  bool isAnimation = true;

  void changeAnimation(bool change) {
    isAnimation = change;
    notifyListeners();
  }

  //BookMark
  List<String>? bookMarkPlanet = [];

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    List<String>? book = await shareHelper.getPlanetData();
    if (book != null) {
      bookMarkPlanet = book;
    }
    notifyListeners();
  }

  void addBookMark() {
    ShareHelper shareHelper = ShareHelper();
    bookMarkPlanet!.add(planet[index!].name!);
    shareHelper.setPlanet(bookMarkPlanet!);
    getBookMark();
    notifyListeners();
  }

  void deleteBookMark() {
    ShareHelper shareHelper = ShareHelper();
    bookMarkPlanet!.remove(planet[index!].name);
    shareHelper.setPlanet(bookMarkPlanet!);
    getBookMark();
    notifyListeners();
  }

  int? index;

  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
