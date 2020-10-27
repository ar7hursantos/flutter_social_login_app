import 'package:dartz/dartz.dart';

import '../../../../../../shared/models/user_model.dart';
import '../../entities/user_result.dart';
import '../../errors/user_errors.dart';

mixin IUpdateUserToDatabase {
  Future<Either<UserFailure, UserResult>> call(UserModel user);
}
