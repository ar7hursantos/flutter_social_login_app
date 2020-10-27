import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../infrastructure/hive/custom_hive.dart' as hive_db;
import '../../../../shared/models/user_model.dart';
import '../../domain/errors/logout_errors.dart';
import '../../domain/repositories/i_drawer_app_repository.dart';
import '../../infra/datasources/i_drawer_app_datasource.dart';

part 'drawer_app_repository.g.dart';

@Injectable(singleton: false)
class DrawerAppRepository implements IDrawerAppRepository {
  final IDrawerAppDatasource datasource;

  DrawerAppRepository(this.datasource);

  @override
  Future<Either<LogoutFailure, Unit>> logout(UserModel user) async {
    try {
      await datasource.logout();
      await clearDatabase();

      return right(unit);
    } on LogoutFailure catch (e) {
      return left(e);
    }
  }

  Future<void> clearDatabase() async {
    await hive_db.clearHiveDB();
  }
}
