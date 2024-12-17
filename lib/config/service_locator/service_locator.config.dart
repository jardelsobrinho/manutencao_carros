// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../ui/carros_cadastro/carros_cadastro_viewmodel.dart' as _i168;
import '../../ui/carros_pesquisa/carros_pesquisa_viewmodel.dart' as _i893;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i893.CarrosPesquisaViewModel>(
        () => _i893.CarrosPesquisaViewModel());
    gh.factory<_i168.CarrosCadastroViewmodel>(
        () => _i168.CarrosCadastroViewmodel());
    return this;
  }
}
