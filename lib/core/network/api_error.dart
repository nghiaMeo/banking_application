class ApiError implements Exception {
  final String message;

  const ApiError(this.message);

  @override
  String toString() => 'ApiError: $message';
}
