import 'package:firebase_core/firebase_core.dart';
import 'package:kunke_naturals_admin_app/core/utils/logger.dart';

abstract class Failure {
  String get message;
  @override
  operator ==(other) {
    return other is Failure && message == other.message;
  }

  @override
  int get hashCode => message.hashCode;
}

class NetworkFailure extends Failure {
  @override
  String get message => "Network unavailable";
}

class ServerFailure extends Failure {
  final String msg;
  ServerFailure([this.msg = ""]);
  @override
  String get message => msg;
}

class FirebaseServerFailure extends Failure {
  final FirebaseException exception;
  FirebaseServerFailure(this.exception);
  @override
  String get message {
    Log.e(exception.toString());
    switch (exception.code) {
      case 'invalid-email':
        return 'Invalid email address or password';

      case 'user-not-found':
        return 'User not found';

      case 'wrong-password':
        return 'Invalid email address or password';

      case 'email-already-in-use':
        return 'Email address already in use';

      case 'weak-password':
        return 'Password is too weak';

      case 'network-request-failed':
        return 'Network request failed';

      case 'too-many-requests':
        return 'Too many requests';

      case 'user-disabled':
        return 'User disabled, Please contact support';

      case 'user-token-expired':
        return 'Session expired';

      case 'user-token-invalid':
        return 'Session expired';

      case 'user-token-not-found':
        return 'Session expired';

      case 'user-token-revoked':
        return 'Session expired';

      case 'invalid-action-code':
        return 'Session expired';

      default:
        return 'An unexpected error occured';
    }
  }
}

class UnexpectedFailure extends Failure {
  @override
  String get message => "Unexpected error occurred";
}

class InvalidArgOrDataFailure extends Failure {
  final String msg;
  InvalidArgOrDataFailure([this.msg = "Some fields are invalid"]);
  @override
  String get message => msg;
}

class LocalAuthFailure extends Failure {
  @override
  String get message => "Biometric authentication failed";
}
