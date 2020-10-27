import 'package:flutter_modular/flutter_modular.dart';
import '../base/auth/auth_dependences.dart';

import 'create_account/create_account_module.dart';
import 'login/login_module.dart';

class AuthenticationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Other Modules
        ...AuthDependences.load(),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/create_account', module: CreateAccountModule()),
      ];

  static Inject get to => Inject<AuthenticationModule>.of();
}
