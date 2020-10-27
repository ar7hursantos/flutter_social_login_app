import 'package:dartz/dartz.dart';

import '../../domain/entities/user_result.dart';
import '../../domain/errors/authentication_errors.dart';
import '../models/input_login_email_password.dart';

abstract class ILoginWithEmailAndPassword {
  Future<Either<AuthenticationFailure, UserResult>> call(
      InputLoginEmailPasswordModel inputModel);
}
