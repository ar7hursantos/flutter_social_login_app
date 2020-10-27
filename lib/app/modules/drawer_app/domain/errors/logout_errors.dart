import 'drawer_app_errors.dart';

class LogoutFailure implements DrawerAppFailure {
  String message = 'Erro ao sair do aplicativo.';
}

class LogoutUserActivityOfflineError extends LogoutFailure {
  String message = 'Erro ao alterar o status, antes de sair do app.';
}
