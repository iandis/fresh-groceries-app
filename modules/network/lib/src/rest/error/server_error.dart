import 'dart:convert';

class ServerError implements Exception {
  ServerError({
    required String responseBody,
  }) {
    final Map<String, dynamic> bodyJson =
        jsonDecode(responseBody) as Map<String, dynamic>;

    _message = bodyJson['error'] as String? ?? 'Server error.';
  }

  ServerError.create({
    required String message,
  }) : _message = message;

  late final String _message;

  @override
  String toString() => _message;
}
