import '../../../../../shared/models/user_model.dart';
import '../../domain/entities/user_result.dart';

class UserResultModel extends UserResult {
  final UserModel user;

  const UserResultModel({this.user});
}
