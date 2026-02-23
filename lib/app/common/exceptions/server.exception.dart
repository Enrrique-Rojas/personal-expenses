class ServerException implements Exception {
  final String code;
  final String message;

  ServerException({required this.code, this.message = ''});
}
