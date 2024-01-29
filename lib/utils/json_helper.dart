import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:planets_app/screen/home/model/home_model.dart';

class JsonHelper {
  Future<List<HomeModel>> planetJson() async {
    var jsonString = await rootBundle.loadString('assets/json/planet.json');
    List planet = jsonDecode(jsonString);
    List<HomeModel> modelList =
        planet.map((e) => HomeModel.mapToModel(e)).toList();
    return modelList;
  }
}
