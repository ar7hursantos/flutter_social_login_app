import '../../domain/entities/create_account_result.dart';

class CreateAccountResultModel extends CreateAccountResult {
  String id;
  String name;
  String email;
  String photoUrl;

  CreateAccountResultModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
  });
}
