import 'package:api_cuidapet/application/config/database_connection_configuration.dart';
import 'package:api_cuidapet/application/logger/i_logger.dart';
import 'package:api_cuidapet/application/logger/logger.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';

class ApplicationConfig {
  Future<void> loadConfigApplication() async {
    await _loadEnv();
    _loadDatabaseConfig();
    _configLog();

    // var x = env['abc'];
    // print(x);
  }

  Future<void> _loadEnv() async => DotEnv()..load();
  var env = DotEnv(includePlatformEnvironment: true)..load();

  void _loadDatabaseConfig() {
    final databaseConfig = DatabaseConnectionConfiguration(
      host: env['DATABASE_HOST'] ?? env['databaseHost']!,
      user: env['DATABASE_USER'] ?? env['databaseUser']!,
      port: int.tryParse(env['DATABASE_PORT'] ?? env['databasePort']!) ?? 0,
      password: env['DATABASE_PASSWORD'] ?? env['databasePassword']!,
      databaseName: env['DATABASE_NAME'] ?? env['databaseName']!,
    );
    GetIt.I.registerSingleton(databaseConfig);
  }

  void _configLog() => GetIt.I.registerLazySingleton<ILogger>(() => Logger());
}
