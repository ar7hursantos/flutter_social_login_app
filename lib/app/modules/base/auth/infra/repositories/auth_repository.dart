import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/auth_result.dart';
import '../../domain/errors/auth_errors.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/firebase/i_auth_firebase_datasource.dart';

part 'auth_repository.g.dart';

@Injectable(singleton: false)
class AuthRepository implements IAuthRepository {
  final IAuthFirebaseDatasource _datasource;

  AuthRepository(
    this._datasource,
  );

  @override
  Future<AuthResult> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userResultModel =
          await _datasource.createUserWithEmailAndPassword(email, password);

      return userResultModel;
    } on AuthFailure catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthResult> authWithEmailAndPassword(
      String email, String password) async {
    try {
      final userResultModel =
          await _datasource.authWithEmailAndPassword(email, password);

      return userResultModel;
    } on AuthFailure catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthResult> authWithFacebook() async {
    try {
      final authResultModel = await _datasource.authWithFacebook();

      return authResultModel;
    } on AuthFailure catch (_) {
      rethrow;
    }
  }
}
