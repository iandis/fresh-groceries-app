import 'dart:convert';

import 'package:http/http.dart';

import 'request_type.dart';
import 'rest_client.dart';
import 'rest_request.dart';
import 'rest_response_parser.dart';

dynamic _getDataFromJson(String responseBody) {
  final Map<String, dynamic> jsonMap =
      jsonDecode(responseBody) as Map<String, dynamic>;
  return jsonMap['data'] ?? jsonMap;
}

abstract class RESTEndpoint<T extends Object?> {
  const RESTEndpoint({
    required RESTClient restClient,
    required RESTResponseParser<T> parser,
  })  : _restClient = restClient,
        _parser = parser;

  final RESTClient _restClient;

  final RESTResponseParser<T> _parser;

  String get endpoint;

  RequestType get requestType;

  String _maybeReplaceVariablesInEndpoint(Map<String, String>? variables) {
    if (variables?.isNotEmpty != true) {
      return endpoint;
    }

    String endpointWithVariables = endpoint;

    for (final String variableKey in variables!.keys) {
      endpointWithVariables = endpointWithVariables.replaceAll(
        '{$variableKey}',
        variables[variableKey]!,
      );
    }

    return endpointWithVariables;
  }

  Future<T> execute(RESTRequest request) async {
    final Response response = await _restClient.executeRequest(
      requestType,
      _maybeReplaceVariablesInEndpoint(request.queryVariables),
      request,
    );

    if (response.statusCode != 200) {
      _parser.onError(
        RESTResponseParser.convertErrorCodeToException(
          errorCode: response.statusCode,
          responseBody: response.body,
        ),
        StackTrace.current,
      );
    }

    return _parser.parse(_getDataFromJson(response.body));
  }
}
