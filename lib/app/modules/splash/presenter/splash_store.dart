import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/stores/user_store.dart';

part 'splash_store.g.dart';

@Injectable()
class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final UserStore userStore;

  _SplashStoreBase(this.userStore);
}
