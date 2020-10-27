import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../entities/user_result.dart';
import '../errors/user_errors.dart';
import '../repositories/i_user_repository.dart';
import 'interfaces/i_get_logged_user_from_database.dart';

part 'get_logged_user_from_database.g.dart';

@Injectable(singleton: false)
class GetLoggedUserFromDatabase implements IGetLoggedUserFromDatabase {
  final IUserRepository iUserRepository;

  GetLoggedUserFromDatabase(this.iUserRepository);

  @override
  Future<Either<UserFailure, UserResult>> call() async {
    try {
      var result = await _execute();
      return right(result);
    } on UserFailure catch (e) {
      return left(e);
    }
  }

  Future<UserResult> _execute() async {
    var result = await iUserRepository.loadCurrentUserFromDatabase();
    return result;
  }
}
