import 'package:api_cuidapet/entities/user.dart';

abstract class IUserRepository {
  Future<User> createUser(User user);
}
