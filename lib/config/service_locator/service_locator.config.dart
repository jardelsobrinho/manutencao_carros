// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../data/repositories/carros/carro_repository.dart' as _i585;
import '../../data/repositories/carros/carro_repository_impl.dart' as _i7;
import '../../data/services/api/carro_services.dart' as _i850;
import '../../data/services/api/supabase/carro_supabase_services.dart' as _i881;
import '../../ui/carros_cadastro/carros_cadastro_viewmodel.dart' as _i446;
import '../../ui/carros_pesquisa/carros_pesquisa_viewmodel.dart' as _i364;
import '../supabase/supabase_module.dart' as _i784;

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
    final registerModule = _$RegisterModule();
    gh.singleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.factory<_i850.CarroServices>(() => _i881.CarroSupabaseServices(
        supabaseClient: gh<_i454.SupabaseClient>()));
    gh.factory<_i585.CarroRepository>(
        () => _i7.CarroRepositoryImpl(service: gh<_i850.CarroServices>()));
    gh.factory<_i446.CarrosCadastroViewmodel>(() =>
        _i446.CarrosCadastroViewmodel(repository: gh<_i585.CarroRepository>()));
    gh.factory<_i364.CarrosPesquisaViewModel>(() =>
        _i364.CarrosPesquisaViewModel(repository: gh<_i585.CarroRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i784.RegisterModule {}
