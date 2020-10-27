import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/login_with_email_and_password.dart';
import 'domain/usecases/login_with_facebook.dart';
import 'presenter/stores/login_store.dart';
import 'presenter/ui/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Data

        // Domain
        $LoginWithFacebook,
        $LoginWithEmailAndPassword,

        //Presentation
        $LoginStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
