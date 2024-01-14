import 'package:api_cuidapet/application/routers/i_router.dart';
import 'package:api_cuidapet/modules/teste/teste_controller.dart';
import 'package:shelf_router/src/router.dart';

class TesteRouter implements IRouter {
  @override
  void configure(Router router) {
    router.mount('/ola/', TesteController().router);
  }
}
