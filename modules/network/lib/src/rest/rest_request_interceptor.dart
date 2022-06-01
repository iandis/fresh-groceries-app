import 'dart:async';

import 'rest_request.dart';

abstract class RESTRequestInterceptor {
  FutureOr<RESTRequest> onRequest(RESTRequest current);
}
