import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/database/interfaces/i_user_database.dart';
import '../../../../shared/stores/user_store.dart';

part 'home_store.g.dart';

@Injectable()
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final UserStore userStore;

  _HomeStoreBase(this.userStore);

  GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
}
