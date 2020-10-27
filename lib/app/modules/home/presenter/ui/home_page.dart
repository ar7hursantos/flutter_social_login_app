import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../drawer_app/drawer_app_module.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.homeScaffoldKey,
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: RouterOutlet(module: DrawerAppModule()),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
