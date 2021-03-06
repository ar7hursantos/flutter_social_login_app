import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../entities/auth_result.dart';
import '../errors/auth_errors.dart';
import '../repositories/i_auth_repository.dart';
import 'interfaces/i_auth_with_email_and_password.dart';

part 'auth_with_email_and_password.g.dart';

@Injectable(singleton: false)
class AuthWithEmailAndPassword implements IAuthWithEmailAndPassword {
  final IAuthRepository _repository;

  AuthWithEmailAndPassword(this._repository);

  @override
  Future<Either<AuthFailure, AuthResult>> call(
      String email, String password) async {
    try {
      var result = await _execute(email, password);
      return right(result);
    } on AuthFailure catch (e) {
      return left(e);
    }
  }

  Future<AuthResult> _execute(String email, String password) async {
    try {
      final result =
          await _repository.authWithEmailAndPassword(email, password);
      return result;
    } on AuthFailure {
      rethrow;
    }
  }
}
