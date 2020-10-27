import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/splash_page.dart';
import 'presenter/splash_store.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Data

        // Domain

        //Presentation
        $SplashStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
