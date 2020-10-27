import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../entities/auth_result.dart';
import '../errors/auth_errors.dart';
import '../repositories/i_auth_repository.dart';
import 'interfaces/i_auth_with_facebook.dart';

part 'auth_with_facebook.g.dart';

@Injectable(singleton: false)
class AuthWithFacebook implements IAuthWithFacebook {
  final IAuthRepository _repository;

  AuthWithFacebook(this._repository);

  @override
  Future<Either<AuthFailure, AuthResult>> call() async {
    try {
      var result = await _executeAuth();
      return right(result);
    } on AuthFailure catch (e) {
      return left(e);
    }
  }

  Future<AuthResult> _executeAuth() async {
    try {
      final result = await _repository.authWithFacebook();
      return result;
    } on AuthFailure {
      rethrow;
    }
  }
}
