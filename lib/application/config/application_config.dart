import 'package:dotenv/dotenv.dart';

class ApplicationConfig {
  Future<void> loadConfigApplication() async {
    await _loadEnv();

    // var env = DotEnv(includePlatformEnvironment: true)..load();
    // var x = env['abc'];
    // print(x);
  }

  Future<void> _loadEnv() async => DotEnv().load();
}
