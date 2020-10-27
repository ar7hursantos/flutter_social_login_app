import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/errors/logout_errors.dart';
import '../../infra/datasources/i_drawer_app_datasource.dart';

part 'drawer_app_datasource.g.dart';

@Injectable(singleton: false)
class DrawerAppDatasource implements IDrawerAppDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Unit> logout() async {
    try {
      var facebookLogin = FacebookLogin();
      await facebookLogin.logOut();
      await _firebaseAuth.signOut();
      return unit;
    } on Exception catch (_) {
      throw LogoutFailure();
    }
  }
}
