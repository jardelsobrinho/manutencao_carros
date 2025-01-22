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

import '../../data/repositories/consumo_veiculos/consumo_veiculos_repository.dart'
    as _i110;
import '../../data/repositories/consumo_veiculos/consumo_veiculos_repository_impl.dart'
    as _i482;
import '../../data/repositories/veiculos/veiculo_repository.dart' as _i191;
import '../../data/repositories/veiculos/veiculo_repository_impl.dart' as _i204;
import '../../data/services/api/consumo_veiculo_services.dart' as _i327;
import '../../data/services/api/supabase/consumo_veiculo_supabase_services.dart'
    as _i745;
import '../../data/services/api/supabase/veiculo_supabase_services.dart'
    as _i672;
import '../../data/services/api/veiculo_services.dart' as _i422;
import '../../ui/veiculo_cadastro/veiculo_cadastro_viewmodel.dart' as _i778;
import '../../ui/veiculo_manutencao/veiculo_manutencao_viewmodel.dart' as _i961;
import '../../ui/veiculo_pesquisa/veiculo_pesquisa_viewmodel.dart' as _i652;
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
    gh.singleton<_i327.ConsumoVeiculoServices>(() =>
        _i745.ConsumoVeiculoSupabaseServices(
            supabaseClient: gh<_i454.SupabaseClient>()));
    gh.singleton<_i110.ConsumoVeiculosRepository>(() =>
        _i482.ConsumoVeiculosRepositoryImpl(
            service: gh<_i327.ConsumoVeiculoServices>()));
    gh.singleton<_i422.VeiculoServices>(() => _i672.VeiculoSupabaseServices(
        supabaseClient: gh<_i454.SupabaseClient>()));
    gh.singleton<_i191.VeiculoRepository>(() =>
        _i204.VeiculoRepositoryImpl(service: gh<_i422.VeiculoServices>()));
    gh.factory<_i778.VeiculoCadastroViewmodel>(() =>
        _i778.VeiculoCadastroViewmodel(
            repository: gh<_i191.VeiculoRepository>()));
    gh.factory<_i961.VeiculoManutencaoViewmodel>(() =>
        _i961.VeiculoManutencaoViewmodel(
            repository: gh<_i191.VeiculoRepository>()));
    gh.factory<_i652.VeiculoPesquisaViewModel>(() =>
        _i652.VeiculoPesquisaViewModel(
            repository: gh<_i191.VeiculoRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i784.RegisterModule {}
