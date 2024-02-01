import 'package:api_cuidapet/entities/user.dart';

abstract class IUserService {
  
  Future<User> createUser(User user)
}