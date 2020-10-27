import '../entities/user_result.dart';

abstract class IUserRepository {
  Future<UserResult> registerUserFromHttp(UserResult userResult);
  Future<void> saveUserToLocalDatabase(UserResult userResult);
  Future<UserResult> loadCurrentUserFromDatabase();
}
