import '../../domain/entities/result.dart';
import '../../domain/errors/drawer_app_errors.dart';

abstract class DrawerAppState {}

class DrawerAppStartState implements DrawerAppState {
  const DrawerAppStartState();
}

class DrawerAppLoadingState implements DrawerAppState {
  const DrawerAppLoadingState();
}

class DrawerAppErrorState implements DrawerAppState {
  final DrawerAppFailure error;
  const DrawerAppErrorState(this.error);
}

class DrawerAppSuccessState implements DrawerAppState {
  final Result result;
  const DrawerAppSuccessState(this.result);
}
