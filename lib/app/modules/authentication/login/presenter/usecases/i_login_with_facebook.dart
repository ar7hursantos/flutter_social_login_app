import 'package:dartz/dartz.dart';

import '../../domain/entities/user_result.dart';
import '../../domain/errors/authentication_errors.dart';

abstract class ILoginWithFacebook {
  Future<Either<AuthenticationFailure, UserResult>> call();
}
