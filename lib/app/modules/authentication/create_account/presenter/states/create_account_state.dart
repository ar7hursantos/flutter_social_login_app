import '../../domain/entities/create_account_result.dart';
import '../../domain/errors/create_account_errors.dart';

abstract class CreateAccountState {}

class CreateAccountStartState implements CreateAccountState {
  const CreateAccountStartState();
}

class CreateAccountLoadingState implements CreateAccountState {
  const CreateAccountLoadingState();
}

class CreateAccountErrorState implements CreateAccountState {
  final CreateAccountFailure error;
  const CreateAccountErrorState(this.error);
}

class CreateAccountSuccessState implements CreateAccountState {
  final CreateAccountResult result;
  const CreateAccountSuccessState(this.result);
}
