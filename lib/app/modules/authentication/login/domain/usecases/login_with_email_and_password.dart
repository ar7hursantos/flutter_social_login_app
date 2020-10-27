import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../base/auth/domain/usecases/interfaces/i_auth_with_email_and_password.dart';
import '../../presenter/models/input_login_email_password.dart';
import '../../presenter/usecases/i_login_with_email_and_password.dart';
import '../entities/user_result.dart';
import '../errors/authentication_errors.dart';

part 'login_with_email_and_password.g.dart';

@Injectable(singleton: false)
class LoginWithEmailAndPassword implements ILoginWithEmailAndPassword {
  final IAuthWithEmailAndPassword _iAuthWithEmailAndPassword;

  LoginWithEmailAndPassword(this._iAuthWithEmailAndPassword);

  @override
  Future<Either<AuthenticationFailure, UserResult>> call(
      InputLoginEmailPasswordModel inputModel) async {
    try {
      var result = await _execute(inputModel);
      return right(result);
    } on AuthenticationFailure catch (e) {
      return left(e);
    }
  }

  Future<UserResult> _execute(InputLoginEmailPasswordModel inputModel) async {
    final result =
        await _iAuthWithEmailAndPassword(inputModel.email, inputModel.password);

    return result.fold((l) {
      throw AuthenticationFailure(message: l.message);
    }, (r) {
      var userResult = UserResult(
        id: r.id,
        name: r.name,
        email: r.email,
        photoUrl: r.photoUrl,
      );
      return userResult;
    });
  }
}
