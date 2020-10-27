import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/models/user_model.dart';
import '../entities/user_result.dart';
import '../errors/user_errors.dart';
import '../repositories/i_user_repository.dart';
import 'interfaces/i_update_user_to_database.dart';

part 'update_user_to_database.g.dart';

@Injectable(singleton: false)
class UpdateUserToDatabase implements IUpdateUserToDatabase {
  final IUserRepository iUserRepository;

  UpdateUserToDatabase(this.iUserRepository);

  @override
  Future<Either<UserFailure, UserResult>> call(UserModel user) async {
    try {
      var result = await _execute(user);
      return right(result);
    } on UserFailure catch (e) {
      return left(e);
    }
  }

  Future<UserResult> _execute(UserModel user) async {
    var userResult = UserResult(user: user);
    var result = await iUserRepository.registerUserFromHttp(userResult);
    await iUserRepository.saveUserToLocalDatabase(result);
    return result;
  }
}
