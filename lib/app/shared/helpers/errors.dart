abstract class Failure implements Exception {
  String get message;
}

class FirebaseFailure extends Failure {
  final String message;
  final String code;
  FirebaseFailure({
    this.message,
    this.code,
  });
}

class DefaultFailure extends Failure {
  final String message;
  DefaultFailure({
    this.message,
  });
}
