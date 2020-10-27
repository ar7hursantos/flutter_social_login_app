import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/backend/user_datasource.dart.dart';
import 'data/datasources/database/user_database_datasource.dart';
import 'domain/usecases/get_logged_user_from_database.dart';
import 'domain/usecases/register_and_save_user.dart';
import 'domain/usecases/update_user_to_database.dart';
import 'infra/repositories/user_repository.dart';

class UserDependences {
  static List<Bind> load() {
    return [
      // Data
      $UserDatasource,
      $UserDatabaseDatasource,
      $UserRepository,

      // Domain
      $GetLoggedUserFromDatabase,
      $RegisterAndSaveUser,
      $UpdateUserToDatabase,

      //Presentation
    ];
  }
}
