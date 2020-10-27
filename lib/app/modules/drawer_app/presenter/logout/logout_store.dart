import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/models/user_model.dart';
import '../../../../shared/stores/user_store.dart';
import '../../domain/usecases/logout.dart';
import 'states/logout_state.dart';

part 'logout_store.g.dart';

@Injectable()
class LogoutStore = _LogoutStoreBase with _$LogoutStore;

abstract class _LogoutStoreBase with Store {
  final UserStore userStore;
  final ILogout iLogout;

  _LogoutStoreBase(
    this.userStore,
    this.iLogout,
  );

  Future<void> logout(UserModel loggedUser) async {
    setState(LogoutLoadingState());

    var result = await iLogout.call(loggedUser);
    var finalState = result.fold(
        (l) => LogoutErrorState(l), (r) => LogoutSuccessState(null));

    setState(finalState);
  }

  @observable
  LogoutState state = LogoutStartState();
  @action
  LogoutState setState(LogoutState value) => state = value;
}
