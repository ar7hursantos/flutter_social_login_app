import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/input_create_account_model.dart';
import '../states/create_account_state.dart';
import '../usecases/i_create_account.dart';

part 'create_account_store.g.dart';

@Injectable(singleton: false)
class CreateAccountStore = _CreateAccountStoreBase with _$CreateAccountStore;

abstract class _CreateAccountStoreBase with Store {
  final ICreateAccount iCreateAccount;

  _CreateAccountStoreBase(this.iCreateAccount);

  Future<void> createAccount() async {
    setState(CreateAccountLoadingState());

    var inputCreateAccountModel = InputCreateAccountModel(
      email: 'teste1@learningon.app',
      password: '321321',
    );
    var result = await iCreateAccount(inputCreateAccountModel);

    var finalState = result.fold(
      (l) => CreateAccountErrorState(l),
      (r) => CreateAccountSuccessState(r),
    );

    setState(finalState);
  }

  @observable
  CreateAccountState state = CreateAccountStartState();
  @action
  CreateAccountState setState(CreateAccountState value) => state = value;
}
