import 'dart:convert';

class RequestError implements Exception {
  RequestError({
    required String responseBody,
  }) {
    final Map<String, dynamic> bodyJson =
        jsonDecode(responseBody) as Map<String, dynamic>;

    _message = bodyJson['error'] as String? ?? 'Request error.';
  }

  RequestError.create({
    required String message,
  }) : _message = message;

  late final String _message;

  @override
  String toString() => _message;
}
