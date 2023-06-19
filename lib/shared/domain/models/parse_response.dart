// To parse this JSON data, do
//
//     final parseResponse = parseResponseFromMap(jsonString);

class ParseResponse<T> {
  ParseResponse({
    this.status,
    this.message,
    this.data,
    this.success = false,
  });
  final bool success;
  final String? status;
  final String? message;
  final T? data;

  factory ParseResponse.fromMap(
    Map<String, dynamic> json, {
    required T Function(Map<String, dynamic> json) modifier,
  }) {
    return ParseResponse<T>(
      success: json['status'] == 'success',
      status: json['status'],
      message: json['message'],
      data: modifier(json),
    );
  }
}
