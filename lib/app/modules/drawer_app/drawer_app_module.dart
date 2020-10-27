import 'package:flutter_modular/flutter_modular.dart';

import 'data/backend/drawer_app_datasource.dart';
import 'domain/usecases/logout.dart';
import 'infra/repositories/drawer_app_repository.dart';
import 'presenter/drawer_app_page.dart';
import 'presenter/drawer_app_store.dart';
import 'presenter/logout/logout_store.dart';

class DrawerAppModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Data
        $DrawerAppDatasource,
        $DrawerAppRepository,

        // Domain
        $Logout,

        //Presentation
        $DrawerAppStore,
        $LogoutStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => DrawerAppPage()),
      ];

  static Inject get to => Inject<DrawerAppModule>.of();
}
