import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/auth_result.dart';
import '../../../domain/errors/auth_errors.dart';
import '../../../infra/datasources/firebase/i_auth_firebase_datasource.dart';
import '../../../infra/models/auth_result_model.dart';

part 'auth_firebase_datasource.g.dart';

@Injectable(singleton: false)
class AuthFirebaseDatasource implements IAuthFirebaseDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthResult> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var createUserResult =
          (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ));

      var userResultModel =
          (createUserResult != null && createUserResult.user != null)
              ? AuthResultModel.fromFirebaseUser(createUserResult.user)
              : throw InvalidUser();
      return userResultModel;
    } on PlatformException catch (e) {
      print(e.message);
      throw InvalidEmailAndPasswordCombination();
    } on FirebaseAuthException catch (e) {
      throw FirebaseError(e.code);
    } on Exception catch (_) {
      throw ServerError();
    }
  }

  @override
  Future<AuthResult> authWithEmailAndPassword(
      String email, String password) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      var userResultModel = (authResult != null && authResult.user != null)
          ? AuthResultModel.fromFirebaseUser(authResult.user)
          : throw InvalidUser();

      return userResultModel;
    } on PlatformException catch (_) {
      throw InvalidEmailAndPasswordCombination();
    } on FirebaseAuthException catch (e) {
      throw FirebaseError(e.code);
    } on Exception catch (_) {
      throw ServerError();
    }
  }

  @override
  Future<AuthResult> authWithFacebook() async {
    var facebookLogin = FacebookLogin();
    //facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
    var result = await facebookLogin.logIn(['email', 'public_profile']);
    var userResultModel;

    try {
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final credential =
              FacebookAuthProvider.credential(result.accessToken.token);
          final userCredential =
              (await _firebaseAuth.signInWithCredential(credential));

          var userResultModel =
              (userCredential != null && userCredential.user != null)
                  ? AuthResultModel.fromFirebaseUser(userCredential.user)
                  : throw InvalidUser();

          return userResultModel;
        case FacebookLoginStatus.cancelledByUser:
          throw CancelledByUser();
        case FacebookLoginStatus.error:
          throw FacebookError(message: result.errorMessage);
      }

      return userResultModel;
    } on Exception catch (e) {
      if (e is AuthFailure) {
        rethrow;
      }
      throw ServerError();
    }
  }
}
