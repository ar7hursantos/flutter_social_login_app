import '../../domain/entities/result.dart';
import '../../domain/errors/errors.dart';

abstract class DefaultState {}

class StartState implements DefaultState {
  const StartState();
}

class LoadingState implements DefaultState {
  const LoadingState();
}

class ErrorState implements DefaultState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements DefaultState {
  final List<Result> list;
  const SuccessState(this.list);
}
