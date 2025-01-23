// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumo_veiculo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumoVeiculoModelImpl _$$ConsumoVeiculoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsumoVeiculoModelImpl(
      id: (json['id'] as num?)?.toInt(),
      litros: (json['litros'] as num).toDouble(),
      precoTotal: (json['preco_total'] as num).toDouble(),
      kilometragem: (json['kilometragem'] as num).toInt(),
      veiculoId: (json['veiculo_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ConsumoVeiculoModelImplToJson(
        _$ConsumoVeiculoModelImpl instance) =>
    <String, dynamic>{
      'litros': instance.litros,
      'preco_total': instance.precoTotal,
      'kilometragem': instance.kilometragem,
      'veiculo_id': instance.veiculoId,
    };
