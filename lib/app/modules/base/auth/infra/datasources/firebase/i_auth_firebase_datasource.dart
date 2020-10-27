import '../../../domain/entities/auth_result.dart';

abstract class IAuthFirebaseDatasource {
  Future<AuthResult> createUserWithEmailAndPassword(
      String email, String password);
  Future<AuthResult> authWithEmailAndPassword(String email, String password);
  Future<AuthResult> authWithFacebook();
}
