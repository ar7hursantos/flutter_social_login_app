import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/models/user_model.dart';
import '../../infra/models/user_result_model.dart';
import '../entities/user_result.dart';
import '../errors/user_errors.dart';
import '../repositories/i_user_repository.dart';
import 'interfaces/i_register_and_save_user.dart';

part 'register_and_save_user.g.dart';

@Injectable(singleton: false)
class RegisterAndSaveUser implements IRegisterAndSaveUser {
  final IUserRepository iUserRepository;

  RegisterAndSaveUser(this.iUserRepository);

  @override
  Future<Either<UserFailure, UserResult>> call(UserModel user) async {
    try {
      var userResult = UserResultModel(user: user);
      var result = await _execute(userResult);
      return right(result);
    } on UserFailure catch (e) {
      return left(e);
    }
  }

  Future<UserResult> _execute(UserResult userResult) async {
    var result = await iUserRepository.registerUserFromHttp(userResult);
    await iUserRepository.saveUserToLocalDatabase(result);
    return result;
  }
}
