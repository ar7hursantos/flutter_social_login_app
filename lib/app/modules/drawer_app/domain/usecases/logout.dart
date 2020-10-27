import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/models/user_model.dart';
import '../../domain/repositories/i_drawer_app_repository.dart';
import '../errors/logout_errors.dart';

part 'logout.g.dart';

mixin ILogout {
  Future<Either<LogoutFailure, Unit>> call(UserModel user);
}

@Injectable(singleton: false)
class Logout implements ILogout {
  final IDrawerAppRepository iDrawerAppRepository;

  Logout(this.iDrawerAppRepository);

  @override
  Future<Either<LogoutFailure, Unit>> call(UserModel user) async {
    if (user != null) {
      return await _logout(user);
    } else {
      return await _logout(user);
    }
  }

  Future<Either<LogoutFailure, Unit>> _logout(UserModel user) async {
    var result = await iDrawerAppRepository.logout(user);
    return result;
  }
}
