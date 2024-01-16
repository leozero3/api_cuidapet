import 'package:api_cuidapet/application/database/i_database_connection.dart';
import 'package:api_cuidapet/application/exceptions/database_exception.dart';
import 'package:api_cuidapet/application/exceptions/user_exists_exception.dart';
import 'package:api_cuidapet/application/helpers/cripty_helper.dart';
import 'package:api_cuidapet/application/logger/i_logger.dart';
import 'package:api_cuidapet/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import './i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDatabaseConnection connection;
  final ILogger log;

  UserRepository({required this.connection, required this.log});

  @override
  Future<User> createUser(User user) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
            insert usuario(email, tipo_cadastro, img_avatar, senha, fornecedor_id, social_id)
            values(?,?,?,?,?,?)
        ''';
      final result = await conn.query(query, [
        user.email,
        user.registerType,
        user.imageAvatar,
        CriptyHelper.generateSha256Hassh(user.password ?? ''),
        user.supplierId,
        user.socialKey
      ]);

      final userId = result.insertId;
      return user.copyWith(id: userId, password: null);
    } on MySqlException catch (e, s) {
      if (e.message.contains('usuario.email_UNIQUE')) {
        log.error('Usuario ja cadastrado na base de dados', e, s);
        throw UserExistsException();
      }
      log.error('erro ao Criar usuario', e, s);
      throw DatabaseException(message: 'Erro ao criar usuario', exception: e);
    } finally {
      await conn?.close();
    }
  }
}
