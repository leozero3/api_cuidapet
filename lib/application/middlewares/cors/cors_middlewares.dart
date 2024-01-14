import 'dart:io';

import 'package:api_cuidapet/application/middlewares/middlewares.dart';
import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';

class CorsMiddlewares extends Middlewares {
  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,PATCH, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers':
        '${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}'
  };

  @override
  Future<Response> execute(Request request) async {
    if (request.method == 'OPTIONS') {
      return Response(HttpStatus.ok, headers: headers);
    }

    final response = await innerHandler(request);

    return response.change(headers: headers);
  }
}
