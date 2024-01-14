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
    print('Iniciando CrossDomain');
    if (request.method == 'OPTIONS') {
      print('Retornando Headers do CrossDomain');
      return Response(HttpStatus.ok, headers: headers);
    }
    print('executando funcao CrossDomain');

    final response = await innerHandler(request);
    print('Respondendo para o cliente  CrossDomain');
    return response.change(headers: headers);
  }
}
