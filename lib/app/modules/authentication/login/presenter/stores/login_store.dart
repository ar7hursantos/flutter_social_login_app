import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../shared/models/user_model.dart';
import '../../../../../shared/stores/user_store.dart';
import '../../../../../shared/util/asuka_messages_util.dart';
import '../../domain/entities/user_result.dart';
import '../models/input_login_email_password.dart';
import '../usecases/i_login_with_email_and_password.dart';
import '../usecases/i_login_with_facebook.dart';

part 'login_store.g.dart';

@Injectable(singleton: false)
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginWithEmailAndPassword _iLoginWithEmailAndPassword;
  final ILoginWithFacebook _iLoginWithFacebook;
  final UserStore _userStore;

  _LoginStoreBase(
    this._iLoginWithEmailAndPassword,
    this._iLoginWithFacebook,
    this._userStore,
  );

  final RoundedLoadingButtonController btnLoginController =
      RoundedLoadingButtonController();

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    final inputModel =
        InputLoginEmailPasswordModel(email: email, password: password);

    final result = await _iLoginWithEmailAndPassword(inputModel);

    await result.fold((l) async {
      await btnLoginController.error();
      AsukaMessagesUtil.showDefaultSnackBar(l.message);
      Future.delayed(
          const Duration(milliseconds: 2000), btnLoginController.reset);
    }, (r) async {
      await btnLoginController.success();
      Future.delayed(const Duration(milliseconds: 2000), () async {
        await saveUserToLocalDatabase(r);
        redictedToTheNextPage();
      });
    });
  }

  Future<void> loginWithfacebook() async {
    final result = await _iLoginWithFacebook();

    await result.fold((l) {
      AsukaMessagesUtil.showDefaultSnackBar(l.message);
    }, (r) async {
      await saveUserToLocalDatabase(r);
      redictedToTheNextPage();
    });
  }

  Future<void> saveUserToLocalDatabase(UserResult userResult) async {
    var loggedUser = UserModel(
      id: userResult.id,
      name: userResult.name,
      email: userResult.email,
      photoUrl: userResult.photoUrl,
    );
    await _userStore.saveUserToLocalDatabase(loggedUser);
  }

  void redictedToTheNextPage() {
    Modular.to.pushReplacementNamed('/home/');
  }
}
