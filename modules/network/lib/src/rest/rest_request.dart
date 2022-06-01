class RESTRequest {
  const RESTRequest({
    this.headers,
    this.queryParameters,
    this.body,
    this.queryVariables,
  });

  final Map<String, String>? headers;

  final Map<String, String>? queryParameters;

  /// This is used to replace query parameters in curly-brackets.
  /// 
  /// Example:
  /// ```dart
  /// ...
  /// String get endpoint => 'api/{id}/list'
  /// ...
  /// ...
  /// final RESTRequest request = RESTRequest({
  ///   queryVariables: <String, String>{
  ///     'id': 'id-1',
  ///   },
  /// });
  /// ...
  /// ```
  /// Here `id` in the [queryVariables] will be used to replace the `{id}`
  /// in the `endpoint`.
  /// 
  final Map<String, String>? queryVariables;

  final Map<String, dynamic>? body;

  @override
  String toString() {
    return 'RESTRequest(headers: $headers, queryParameters: $queryParameters, queryVariables: $queryVariables, body: $body)';
  }
}
