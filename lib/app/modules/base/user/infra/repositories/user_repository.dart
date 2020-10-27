import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/user_result.dart';
import '../../domain/errors/user_errors.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../datasources/backend/i_user_datasource.dart';
import '../datasources/database/i_user_database_datasource.dart';
import '../models/user_result_model.dart';

part 'user_repository.g.dart';

@Injectable(singleton: false)
class UserRepository implements IUserRepository {
  final IUserDatasource datasource;
  final IUserDatabaseDatasource databaseDatasource;

  UserRepository(this.datasource, this.databaseDatasource);

  @override
  Future<UserResult> registerUserFromHttp(UserResult userResult) async {
    UserResultModel result;

    try {
      result = await datasource.register(userResult);

      if (result == null || result.user == null || result.user.id == null) {
        throw UserDatasourceResultNull();
      } else {
        return result;
      }
    } on UserFailure catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveUserToLocalDatabase(UserResult userResult) async {
    try {
      var result = await databaseDatasource.save(userResult);

      if (result == null || result.user == null || result.user.id == null) {
        throw UserDatasourceResultNull();
      } else {
        return result;
      }
    } on UserFailure catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserResult> loadCurrentUserFromDatabase() async {
    UserResultModel result;
    try {
      result = await databaseDatasource.loadCurrentUser();

      if (result == null || result.user == null || result.user.id == null) {
        throw UserDatasourceResultNull();
      } else {
        return result;
      }
    } on UserFailure catch (_) {
      rethrow;
    }
  }
}
