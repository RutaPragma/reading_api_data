abstract class Failure {
  final String message;
  final int? code;
  const Failure(this.message, {this.code});
}

class NotFountFailure extends Failure {
  const NotFountFailure(super.message, {super.code});
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
