import 'package:dartz/dartz.dart';

import '../../entities/auth_result.dart';
import '../../errors/auth_errors.dart';

abstract class IAuthWithFacebook {
  Future<Either<AuthFailure, AuthResult>> call();
}
