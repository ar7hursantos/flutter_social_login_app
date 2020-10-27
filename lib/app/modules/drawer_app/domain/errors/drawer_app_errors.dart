class DrawerAppFailure implements Exception {
  String message = 'Erro ao carregar dados.';
}

class DrawerAppSomeError extends DrawerAppFailure {}
