import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../base/auth/domain/usecases/interfaces/i_create_user_with_email_and_password.dart';
import '../../infra/models/create_account_result_model.dart';
import '../../presenter/models/input_create_account_model.dart';
import '../../presenter/usecases/i_create_account.dart';
import '../entities/create_account_result.dart';
import '../errors/create_account_errors.dart';

part 'create_account.g.dart';

@Injectable(singleton: false)
class CreateAccount implements ICreateAccount {
  final ICreateUserWithEmailAndPassword _iCreateUserWithEmailAndPassword;

  CreateAccount(this._iCreateUserWithEmailAndPassword);

  @override
  Future<Either<CreateAccountFailure, CreateAccountResult>> call(
      InputCreateAccountModel inputModel) async {
    try {
      var result = await _execute(inputModel);
      return right(result);
    } on CreateAccountFailure catch (e) {
      return left(e);
    }
  }

  Future<CreateAccountResult> _execute(
      InputCreateAccountModel inputModel) async {
    final result = await _iCreateUserWithEmailAndPassword(
        inputModel.email, inputModel.password);

    return result.fold((l) {
      throw CreateAccountFailure(message: l.message);
    }, (r) {
      var userResult = CreateAccountResultModel(
        id: r.id,
        name: r.name,
        email: r.email,
        photoUrl: r.photoUrl,
      );
      return userResult;
    });
  }
}
