import 'package:api_cuidapet/application/routers/i_router.dart';
import 'package:api_cuidapet/modules/user/controller/auth_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class UserRouter implements IRouter {
  @override
  void configure(Router router) {
    final authController = GetIt.I.get<AuthController>();
    router.mount(
      '/auth/',
      AuthController().router,
    );
  }
}
