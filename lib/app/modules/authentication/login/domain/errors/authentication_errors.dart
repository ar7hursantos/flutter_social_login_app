class AuthenticationFailure implements Exception {
  String message;

  AuthenticationFailure({
    this.message,
  });
}

class InvalidUser extends AuthenticationFailure {}

class CancelledByUser extends AuthenticationFailure {
  String message = 'Login com Facebook cancelado pelo usuário.';
}

class FacebookError extends AuthenticationFailure {
  String message =
      'Ocorreu um erro ao fazer login pelo facebook. Tente novamente.';
}

class ServerError extends AuthenticationFailure {
  String message = 'Ocorreu um erro no servidor.';
}

class InvalidEmailAndPasswordCombination extends AuthenticationFailure {}
