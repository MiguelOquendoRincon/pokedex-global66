/// This file defines the ApiResponse class used for handling API responses in the application.
/// It encapsulates the data, error message, status code, and success status of an API response.
/// The class provides factory methods for creating successful and failed responses.
class ApiResponse<T> {
  /// Data of the response
  final T? data;

  /// Error message.
  final String? errorMessage;

  /// Optional status code for the response.
  final int? statusCode;

  /// Indicates whether the response was successful.
  final bool success;

  const ApiResponse._({
    this.data,
    this.errorMessage,
    this.statusCode,
    required this.success,
  });

  /// Factory method to create a successful response
  /// This method returns an instance of ApiResponse with the provided data and optional status code.
  factory ApiResponse.success(T data, {int? statusCode}) {
    return ApiResponse._(data: data, success: true, statusCode: statusCode);
  }

  /// Factory method to create a failed response
  /// This method returns an instance of ApiResponse with the provided error message and optional status code
  factory ApiResponse.failure(String errorMessage, {int? statusCode}) {
    return ApiResponse._(
      errorMessage: errorMessage,
      success: false,
      statusCode: statusCode,
    );
  }

  @override
  String toString() {
    return success
        ? 'Success: $data'
        : 'Failure: $errorMessage (status: $statusCode)';
  }
}
