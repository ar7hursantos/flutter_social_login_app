import '../../../domain/entities/logout_result.dart';
import '../../../domain/errors/logout_errors.dart';

abstract class LogoutState {}

class LogoutStartState implements LogoutState {
  const LogoutStartState();
}

class LogoutLoadingState implements LogoutState {
  const LogoutLoadingState();
}

class LogoutErrorState implements LogoutState {
  final LogoutFailure error;
  const LogoutErrorState(this.error);
}

class LogoutSuccessState implements LogoutState {
  final LogoutResult result;
  const LogoutSuccessState(this.result);
}
