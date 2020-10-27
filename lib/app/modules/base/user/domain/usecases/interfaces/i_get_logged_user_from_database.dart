import 'package:dartz/dartz.dart';

import '../../entities/user_result.dart';
import '../../errors/user_errors.dart';

mixin IGetLoggedUserFromDatabase {
  Future<Either<UserFailure, UserResult>> call();
}
