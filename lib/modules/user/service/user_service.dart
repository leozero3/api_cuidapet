import 'package:injectable/injectable.dart';

import 'package:api_cuidapet/entities/user.dart';
import 'package:api_cuidapet/modules/user/data/i_user_repository.dart';
import 'package:api_cuidapet/modules/user/view_models/user_save_input_model.dart';

import './i_user_service.dart';

class UserService implements IUserService {
  @LazySingleton(as: IUserService)
  IUserRepository userRepository;

  UserService({required this.userRepository});

  @override
  Future<User> createUser(UserSaveInputModel user) {
    final userEntity = User(
      email: user.email,
      password: user.password,
      registerType: 'App',
      supplierId: user.supplierId,
    );

    return userRepository.createUser(userEntity);
  }
}
