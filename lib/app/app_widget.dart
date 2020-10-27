import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/components/asuka_singleton.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Social Login',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      builder: asuka.builder,
    );
  }
}
