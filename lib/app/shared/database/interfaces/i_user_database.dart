import '../../models/user_model.dart';

abstract class IUserDatabase {
  Future<UserModel> add(UserModel model);
  Future<UserModel> getCurrent();
  Future<void> update(UserModel model);
  Future<void> remove(int id);
  Future<void> clear();
}
