class ApiResponse<T> {
  int httpCode;
  String message;
  T data;

  ApiResponse({
    required this.httpCode,
    required this.message,
    required this.data,
  });
}
