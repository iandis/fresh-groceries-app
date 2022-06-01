import 'dart:developer';

import 'package:http/http.dart';

import 'package:network/src/rest/request_type.dart';
import 'package:network/src/rest/rest_request.dart';
import 'package:network/src/rest/rest_request_interceptor.dart';

part 'rest_client_impl.dart';

abstract class RESTClient {
  const factory RESTClient({
    required Uri baseUrl,
    required Client client,
    List<RESTRequestInterceptor> interceptors,
  }) = _RESTClientImpl;

  Future<Response> executeRequest(
    RequestType type,
    String endpoint,
    RESTRequest request, {
    Client? httpClient,
  });
}
