import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_module.dart';
import 'app/infrastructure/hive/custom_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //set app orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //set AppBar with transparent color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
  );

  // init Hive DB
  await initHiveDB();

  // Initialize Firebase
  await Firebase.initializeApp();

  var prefs = await SharedPreferences.getInstance();

  runApp(
    ModularApp(module: AppModule(prefs)),
  );
}
