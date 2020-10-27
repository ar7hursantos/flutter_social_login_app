import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../shared/database/interfaces/i_user_database.dart';
import '../../../domain/entities/user_result.dart';
import '../../../domain/errors/user_errors.dart';
import '../../../infra/datasources/database/i_user_database_datasource.dart';
import '../../../infra/models/user_result_model.dart';

part 'user_database_datasource.g.dart';

@Injectable(singleton: false)
class UserDatabaseDatasource implements IUserDatabaseDatasource {
  final IUserDatabase database;

  UserDatabaseDatasource(this.database);

  @override
  Future<UserResult> save(UserResult userResult) async {
    try {
      await database.clear();
      var user = await database.add(userResult.user);
      var result = UserResultModel(user: user);
      return result;
    } on Exception catch (_) {
      throw UserDatabaseError();
    }
  }

  @override
  Future<UserResult> loadCurrentUser() async {
    try {
      var user = await database.getCurrent();
      var result = UserResultModel(user: user);
      return result;
    } on Exception catch (_) {
      throw UserDatabaseError();
    }
  }
}
