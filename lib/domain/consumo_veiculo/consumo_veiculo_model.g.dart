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
      precoTotal: (json['precoTotal'] as num).toDouble(),
      kilometragem: (json['kilometragem'] as num).toInt(),
    );

Map<String, dynamic> _$$ConsumoVeiculoModelImplToJson(
        _$ConsumoVeiculoModelImpl instance) =>
    <String, dynamic>{
      'litros': instance.litros,
      'precoTotal': instance.precoTotal,
      'kilometragem': instance.kilometragem,
    };
