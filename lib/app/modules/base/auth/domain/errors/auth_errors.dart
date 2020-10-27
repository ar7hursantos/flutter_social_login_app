class AuthFailure implements Exception {
  String message;

  AuthFailure({
    this.message,
  });
}

class InvalidUser extends AuthFailure {}

class CancelledByUser extends AuthFailure {
  String message = 'Login com Facebook cancelado pelo usuário.';
}

class FacebookError extends AuthFailure {
  String message =
      'Ocorreu um erro ao fazer login pelo facebook. Tente novamente.';

  FacebookError({
    this.message,
  });
}

class FirebaseError extends AuthFailure {
  FirebaseError(String errorCode) {
    _errorMessage(errorCode);
  }

  _errorMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        message = 'O email já foi cadastrado anteriomente.';
        break;
      case 'invalid-email':
        message = 'O email digitado não está formatado corretamente.';
        break;
      case 'wrong-password':
        message = 'Email ou Senha incorreta.';
        break;
      case 'user-not-found':
        message = 'Não foi encontrado um usuário para o email fornecido.';
        break;
      case 'user-disabled':
        message = 'O usuário foi desativado.';
        break;
      case 'too-many-requests':
        message = 'O servidor está sobrecarregado. Tente novamente mais tarde.';
        break;
      case 'operation-not-allowed':
        message = 'Login com usuário e senha não está habilitado no momento.';
        break;
      default:
        message = 'Ocorreu um erro ao tentar autenticar usuário.';
    }
  }
}

class ServerError extends AuthFailure {
  String message = 'Ocorreu um erro no servidor.';
}

class InvalidEmailAndPasswordCombination extends AuthFailure {}
