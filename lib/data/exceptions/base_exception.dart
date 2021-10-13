class BaseException implements Exception {
  final String _message;

  BaseException(String message) : _message = message;

  String toString() => _message;

  String get message => _message;
}
