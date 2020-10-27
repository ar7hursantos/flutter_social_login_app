import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/create_account.dart';
import 'presenter/stores/create_account_store.dart';
import 'presenter/ui/create_account_page.dart';

class CreateAccountModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Data

        // Domain
        $CreateAccount,

        //Presentation
        $CreateAccountStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CreateAccountPage()),
      ];

  static Inject get to => Inject<CreateAccountModule>.of();
}
