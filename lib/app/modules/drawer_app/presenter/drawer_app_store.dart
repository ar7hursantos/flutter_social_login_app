import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/user_model.dart';
import '../presenter/logout/states/logout_state.dart';
import '../presenter/states/drawer_app_state.dart';
import 'logout/logout_store.dart';

part 'drawer_app_store.g.dart';

@Injectable()
class DrawerAppStore = _DrawerAppStoreBase with _$DrawerAppStore;

abstract class _DrawerAppStoreBase with Store {
  final LogoutStore logoutStore;

  _DrawerAppStoreBase(
    this.logoutStore,
  );

  void logout(UserModel user) {
    setState(DrawerAppLoadingState());

    logoutStore.logout(user).then((value) {
      var finalState = logoutStore.state;

      Future.delayed(Duration(seconds: 1)).then((v) {
        if (finalState is LogoutSuccessState) {
          setState(DrawerAppSuccessState(null));
          Modular.to.pushReplacementNamed('/authentication/login');
        } else if (finalState is LogoutErrorState) {
          setState(DrawerAppErrorState(finalState.error));
        }
      });
    });
  }

  @observable
  DrawerAppState state = DrawerAppStartState();
  @action
  DrawerAppState setState(DrawerAppState value) => state = value;
}
