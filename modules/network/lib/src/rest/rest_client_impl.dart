part of 'rest_client.dart';

class _RESTClientImpl implements RESTClient {
  const _RESTClientImpl({
    required Uri baseUrl,
    required Client client,
    List<RESTRequestInterceptor> interceptors =
        const <RESTRequestInterceptor>[],
  })  : _baseUrl = baseUrl,
        _httpClient = client,
        _interceptors = interceptors;

  final Uri _baseUrl;

  final Client _httpClient;

  final List<RESTRequestInterceptor> _interceptors;

  Future<RESTRequest> _interceptRequest(RESTRequest request) async {
    if (_interceptors.isEmpty) {
      return request;
    }

    RESTRequest currentRequest = request;

    for (final RESTRequestInterceptor interceptor in _interceptors) {
      currentRequest = await interceptor.onRequest(currentRequest);
    }

    return currentRequest;
  }

  @override
  Future<Response> executeRequest(
    RequestType type,
    String endpoint,
    RESTRequest request, {
    Client? httpClient,
  }) async {
    final RESTRequest currentRequest = await _interceptRequest(request);

    final Uri uri = _baseUrl.replace(
      path: _baseUrl.path + endpoint,
      queryParameters: currentRequest.queryParameters,
    );

    log(
      'A request to $uri was created with:\n'
      '$currentRequest',
      name: 'RESTClient',
    );

    final Response response = await _executeRequest(
      httpClient: httpClient ?? _httpClient,
      uri: uri,
      type: type,
      request: currentRequest,
    );

    log(
      'A request of $uri comes back with response of: \n'
      '${response.body}',
      name: 'RESTClient',
    );

    return response;
  }

  Future<Response> _executeRequest({
    required Client httpClient,
    required Uri uri,
    required RequestType type,
    required RESTRequest request,
  }) async {
    switch (type) {
      case RequestType.get:
        return httpClient.get(
          uri,
          headers: request.headers,
        );

      case RequestType.post:
        return httpClient.post(
          uri,
          body: request.body,
          headers: request.headers,
        );
    }
  }
}
