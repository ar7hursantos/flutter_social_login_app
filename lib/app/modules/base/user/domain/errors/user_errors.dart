class UserFailure implements Exception {
  String message = 'Erro ao buscar dados do uusário.';
}

class UserInvalidUser extends UserFailure {}

class UserDatasourceResultNull extends UserFailure {}

class UserDatabaseError extends UserFailure {
  String message = 'Erro ao realizar operação no banco de dados.';
}

class UserServerError extends UserFailure {
  String message = 'Ocorreu um erro no servidor.';
}
