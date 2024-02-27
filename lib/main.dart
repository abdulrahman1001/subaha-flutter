import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hivetrain/bind.dart';

import 'package:hivetrain/pageone.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initial();
  runApp(const MyApp());
}

Future initial() async {
  await Get.putAsync(() => bind().getservice());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/', page: () => Pageone()),

      ],
    );
  }
}
