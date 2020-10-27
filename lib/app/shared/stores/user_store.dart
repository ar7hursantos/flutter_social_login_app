import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../database/interfaces/i_user_database.dart';
import '../models/user_model.dart';

part 'user_store.g.dart';

@Injectable()
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final IUserDatabase _iUserDatabase;

  _UserStoreBase(this._iUserDatabase) {
    _init();
  }

  _init() async {
    await getCurrentUserFromDatabase();
  }

  @observable
  UserModel currentUser;

  Future<UserModel> saveUserToLocalDatabase(UserModel user) async {
    await _iUserDatabase.clear();
    currentUser = await _iUserDatabase.add(user);
    return currentUser;
  }

  @action
  Future<UserModel> getCurrentUserFromDatabase() async {
    currentUser = await _iUserDatabase.getCurrent();
    return currentUser;
  }

  bool isLogged() {
    return currentUser != null &&
            currentUser.id != null &&
            currentUser.id.isNotEmpty
        ? true
        : false;
  }
}
