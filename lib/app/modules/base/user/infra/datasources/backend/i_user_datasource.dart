import '../../../domain/entities/user_result.dart';

abstract class IUserDatasource {
  Future<UserResult> register(UserResult userResult);
}
