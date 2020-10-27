import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../base/auth/domain/usecases/interfaces/i_auth_with_facebook.dart';
import '../../presenter/usecases/i_login_with_facebook.dart';
import '../entities/user_result.dart';
import '../errors/authentication_errors.dart';

part 'login_with_facebook.g.dart';

@Injectable(singleton: false)
class LoginWithFacebook implements ILoginWithFacebook {
  final IAuthWithFacebook _iAuthWithFacebook;

  LoginWithFacebook(this._iAuthWithFacebook);

  @override
  Future<Either<AuthenticationFailure, UserResult>> call() async {
    try {
      var result = await _execute();
      return right(result);
    } on AuthenticationFailure catch (e) {
      return left(e);
    }
  }

  Future<UserResult> _execute() async {
    final result = await _iAuthWithFacebook();

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
