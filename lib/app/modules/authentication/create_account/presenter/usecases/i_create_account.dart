import 'package:dartz/dartz.dart';

import '../../domain/entities/create_account_result.dart';
import '../../domain/errors/create_account_errors.dart';
import '../models/input_create_account_model.dart';

abstract class ICreateAccount {
  Future<Either<CreateAccountFailure, CreateAccountResult>> call(
      InputCreateAccountModel inputModel);
}
