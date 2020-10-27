import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_widget.dart';
import 'infrastructure/dio/custom_dio.dart';
import 'infrastructure/infrastructure_dependences.dart';
import 'modules/authentication/authentication_module.dart';
import 'modules/drawer_app/drawer_app_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends MainModule {
  final SharedPreferences prefs;

  AppModule(this.prefs);

  @override
  List<Bind> get binds => [
        Bind((i) => CustomDio.withAuthentication().instance),
        Bind((i) => prefs),
        ...InfrastructureDependencies.load(),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter('/authentication', module: AuthenticationModule()),
        ModularRouter('/drawer', module: DrawerAppModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
