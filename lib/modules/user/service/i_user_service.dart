import 'package:api_cuidapet/entities/user.dart';
import 'package:api_cuidapet/modules/user/view_models/user_save_input_model.dart';

abstract class IUserService {
  Future<User> createUser(UserSaveInputModel user);
}
