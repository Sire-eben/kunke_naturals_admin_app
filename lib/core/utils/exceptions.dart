import 'package:kunke_naturals_admin_app/core/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
abstract class kunke_naturals_admin_appException implements Exception {
  String get message;

  @override
  operator ==(other) {
    return other is kunke_naturals_admin_appException &&
        message == other.message;
  }

  @override
  int get hashCode => message.hashCode;
}

abstract class ServerException implements kunke_naturals_admin_appException {}

class FirebaseServerException implements ServerException {
  final FirebaseException exception;
  FirebaseServerException(this.exception);

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
