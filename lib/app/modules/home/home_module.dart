import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/stores/home_store.dart';
import 'presenter/ui/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Data
        // $DrawerAppDatasource,
        // $DrawerAppRepository,

        // Domain

        //Presentation
        $HomeStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
