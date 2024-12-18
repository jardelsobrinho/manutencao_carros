// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories/carros/carro_repository.dart' as _i585;
import '../../data/repositories/carros/carro_repository_impl.dart' as _i7;
import '../../ui/carros_cadastro/carros_cadastro_viewmodel.dart' as _i446;
import '../../ui/carros_pesquisa/carros_pesquisa_viewmodel.dart' as _i364;

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
    gh.factory<_i364.CarrosPesquisaViewModel>(
        () => _i364.CarrosPesquisaViewModel());
    gh.factory<_i585.CarroRepository>(() => _i7.CarroRepositoryImpl());
    gh.factory<_i446.CarrosCadastroViewmodel>(() =>
        _i446.CarrosCadastroViewmodel(repository: gh<_i585.CarroRepository>()));
    return this;
  }
}
