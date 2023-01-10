abstract class PocoException implements Exception {
  String get message;

  @override
  operator ==(other) {
    return other is PocoException && message == other.message;
  }

  @override
  int get hashCode => message.hashCode;
}

abstract class ServerException implements PocoException {}

class TimeoutServerException implements ServerException {
  final String msg;
  TimeoutServerException([this.msg = "connection timeout"]);

  @override
  String get message => msg;
}

class UnexpectedServerException implements ServerException {
  final String msg;
  UnexpectedServerException([this.msg = "An unexpected error occured"]);

  @override
  String get message => msg;
}

class UnknownServerException implements ServerException {
  @override
  String get message => "An unknown error occured";
}

class SessionExpiredServerException implements ServerException {
  @override
  String get message => "Session expired";
}

class PocoServerException implements ServerException {
  final String msg;
  PocoServerException([this.msg = "An unexpected error occured"]);

  @override
  String get message => msg;
}

class InvalidArgOrDataException implements PocoException {
  final String msg;
  InvalidArgOrDataException([this.msg = "error in arguments or data"]);
  @override
  String get message => msg;
}

class CacheGetException implements PocoException {
  CacheGetException();
  @override
  String get message => "error retrieving data from cache";
}

class CachePutException implements PocoException {
  CachePutException();
  @override
  String get message => "error storing data in cache";
}
