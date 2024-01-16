// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/user/controller/auth_controller.dart' as _i3;
import '../../modules/user/data/i_user_repository.dart' as _i7;
import '../../modules/user/data/user_repository.dart' as _i8;
import '../database/database_connection.dart' as _i5;
import '../database/i_database_connection.dart' as _i4;
import '../logger/i_logger.dart' as _i9;
import 'database_connection_configuration.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthController>(() => _i3.AuthController());
    gh.lazySingleton<_i4.IDatabaseConnection>(() =>
        _i5.DatabaseConnection(gh<_i6.DatabaseConnectionConfiguration>()));
    gh.lazySingleton<_i7.IUserRepository>(() => _i8.UserRepository(
          connection: gh<_i4.IDatabaseConnection>(),
          log: gh<_i9.ILogger>(),
        ));
    return this;
  }
}
