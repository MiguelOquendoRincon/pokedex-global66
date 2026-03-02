enum FailureType {
  /// Authentication failures
  authFailure,

  /// Server failures
  serverFailure,

  /// Client failures
  clientFailure,

  /// Network failures
  networkFailure,

  /// Bad request failures
  badRequestFailure,
}

/// Represents a failure in the application.
/// This class is used to encapsulate error messages and types of failures.
abstract class Failure {
  /// The error message associated with the failure.
  /// This message can be used to provide feedback to the user or for logging purposes.
  final String message;

  /// Creates a [Failure] with the given [message].
  const Failure(this.message);
}

/// Represents a network failure in the application.
/// This class extends [Failure] to indicate that the failure is related to network issues.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Represents a failure related to cache operations.
/// This class extends [Failure] to indicate that the failure is related to caching.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Represents a server failure in the application.
/// This class extends [Failure] to indicate that the failure is related to authentication issues.
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Represents a server failure in the application.
/// This class extends [Failure] to indicate that the failure is related to server issues.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Client failures. Example: 400 Bad Request
class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message);
}
