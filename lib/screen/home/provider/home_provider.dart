import 'package:flutter/material.dart';
import 'package:planets_app/screen/home/model/home_model.dart';
import 'package:planets_app/utils/json_helper.dart';

class HomeProvider with ChangeNotifier {
  // Json
  List<HomeModel> planet = [];

  Future<void> getData() async {
    JsonHelper jsonHelper = JsonHelper();
    List<HomeModel> l1 = await jsonHelper.planetJson();
    planet = l1;
    notifyListeners();
  }

  bool isAnimation = true;

  void changeAnimation(bool change) {
    isAnimation = change;
    notifyListeners();
  }
}
