import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/firebase/auth_firebase_datasource.dart';
import 'domain/usecases/auth_with_email_and_password.dart';
import 'domain/usecases/auth_with_facebook.dart';
import 'domain/usecases/create_user_with_email_and_password.dart';
import 'infra/repositories/auth_repository.dart';

class AuthDependences {
  static List<Bind> load() {
    return [
      // Data
      $AuthFirebaseDatasource,
      $AuthRepository,

      // Domain
      $CreateUserWithEmailAndPassword,
      $AuthWithFacebook,
      $AuthWithEmailAndPassword,

      //Presentation
    ];
  }
}
