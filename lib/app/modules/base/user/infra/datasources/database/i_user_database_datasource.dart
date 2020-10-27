import '../../../domain/entities/user_result.dart';

abstract class IUserDatabaseDatasource {
  Future<UserResult> save(UserResult userResult);
  Future<UserResult> loadCurrentUser();
}
