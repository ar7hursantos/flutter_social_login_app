import 'package:dartz/dartz.dart';

import '../../../../shared/models/user_model.dart';
import '../errors/logout_errors.dart';

abstract class IDrawerAppRepository {
  Future<Either<LogoutFailure, Unit>> logout(UserModel user);
}
