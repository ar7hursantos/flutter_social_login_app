import 'package:flutter_modular/flutter_modular.dart';

import '../shared/database/hive_local_database/user_database.dart';
import '../shared/stores/user_store.dart';

class InfrastructureDependencies {
  static List<Bind> load() {
    return [
      // Local Database ----------------------------------------------------
      $UserDatabase,
      // Shared Stores -----------------------------------------------------
      $UserStore,
    ];
  }
}
