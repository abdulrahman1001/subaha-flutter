import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'package:hivetrain/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bind extends GetxService {
  late SharedPreferences sharedPreferences;
  RxInt counter = 0.obs;
  var name = '';
  Future<bind> getservice() async {
    sharedPreferences = await SharedPreferences.getInstance();
    counter.value = sharedPreferences.getInt('counter') ?? 0;
    name = sharedPreferences.getString('name') ?? 'علمنا اسمك الجميل';

    return this;
  }

  increse() {
    counter.value += 1;
    sharedPreferences.setInt('counter', counter.value);
  }

  reset() {
    counter.value = 0;
    sharedPreferences.setInt('counter', 0);
  }

  setname(nam) {
    name = nam;
    sharedPreferences.setString('name', name);
  }
}
