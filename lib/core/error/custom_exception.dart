class CustomException implements Exception {
  final message;

  CustomException([this.message]);

  String toString() => "$message";
}

class ConnectionException extends CustomException {
  ConnectionException([String message]) : super(message);
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message);
}

class ServerException extends CustomException {
  ServerException([String message]) : super(message);
}

class CacheException extends CustomException {
  CacheException([String message]) : super(message);
}

class UnknownException extends CustomException {
  UnknownException([String message]) : super(message);
}
