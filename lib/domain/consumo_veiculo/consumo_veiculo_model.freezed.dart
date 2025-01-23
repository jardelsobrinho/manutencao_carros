// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumo_veiculo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsumoVeiculoModel _$ConsumoVeiculoModelFromJson(Map<String, dynamic> json) {
  return _ConsumoVeiculoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsumoVeiculoModel {
  @JsonKey(includeToJson: false, includeFromJson: true)
  int? get id => throw _privateConstructorUsedError;
  double get litros => throw _privateConstructorUsedError;
  @JsonKey(name: "preco_total")
  double get precoTotal => throw _privateConstructorUsedError;
  int get kilometragem => throw _privateConstructorUsedError;
  @JsonKey(name: "veiculo_id")
  int get veiculoId => throw _privateConstructorUsedError;

  /// Serializes this ConsumoVeiculoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsumoVeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsumoVeiculoModelCopyWith<ConsumoVeiculoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumoVeiculoModelCopyWith<$Res> {
  factory $ConsumoVeiculoModelCopyWith(
          ConsumoVeiculoModel value, $Res Function(ConsumoVeiculoModel) then) =
      _$ConsumoVeiculoModelCopyWithImpl<$Res, ConsumoVeiculoModel>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true) int? id,
      double litros,
      @JsonKey(name: "preco_total") double precoTotal,
      int kilometragem,
      @JsonKey(name: "veiculo_id") int veiculoId});
}

/// @nodoc
class _$ConsumoVeiculoModelCopyWithImpl<$Res, $Val extends ConsumoVeiculoModel>
    implements $ConsumoVeiculoModelCopyWith<$Res> {
  _$ConsumoVeiculoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsumoVeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? litros = null,
    Object? precoTotal = null,
    Object? kilometragem = null,
    Object? veiculoId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      litros: null == litros
          ? _value.litros
          : litros // ignore: cast_nullable_to_non_nullable
              as double,
      precoTotal: null == precoTotal
          ? _value.precoTotal
          : precoTotal // ignore: cast_nullable_to_non_nullable
              as double,
      kilometragem: null == kilometragem
          ? _value.kilometragem
          : kilometragem // ignore: cast_nullable_to_non_nullable
              as int,
      veiculoId: null == veiculoId
          ? _value.veiculoId
          : veiculoId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumoVeiculoModelImplCopyWith<$Res>
    implements $ConsumoVeiculoModelCopyWith<$Res> {
  factory _$$ConsumoVeiculoModelImplCopyWith(_$ConsumoVeiculoModelImpl value,
          $Res Function(_$ConsumoVeiculoModelImpl) then) =
      __$$ConsumoVeiculoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true) int? id,
      double litros,
      @JsonKey(name: "preco_total") double precoTotal,
      int kilometragem,
      @JsonKey(name: "veiculo_id") int veiculoId});
}

/// @nodoc
class __$$ConsumoVeiculoModelImplCopyWithImpl<$Res>
    extends _$ConsumoVeiculoModelCopyWithImpl<$Res, _$ConsumoVeiculoModelImpl>
    implements _$$ConsumoVeiculoModelImplCopyWith<$Res> {
  __$$ConsumoVeiculoModelImplCopyWithImpl(_$ConsumoVeiculoModelImpl _value,
      $Res Function(_$ConsumoVeiculoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsumoVeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? litros = null,
    Object? precoTotal = null,
    Object? kilometragem = null,
    Object? veiculoId = null,
  }) {
    return _then(_$ConsumoVeiculoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      litros: null == litros
          ? _value.litros
          : litros // ignore: cast_nullable_to_non_nullable
              as double,
      precoTotal: null == precoTotal
          ? _value.precoTotal
          : precoTotal // ignore: cast_nullable_to_non_nullable
              as double,
      kilometragem: null == kilometragem
          ? _value.kilometragem
          : kilometragem // ignore: cast_nullable_to_non_nullable
              as int,
      veiculoId: null == veiculoId
          ? _value.veiculoId
          : veiculoId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumoVeiculoModelImpl implements _ConsumoVeiculoModel {
  _$ConsumoVeiculoModelImpl(
      {@JsonKey(includeToJson: false, includeFromJson: true) required this.id,
      required this.litros,
      @JsonKey(name: "preco_total") required this.precoTotal,
      required this.kilometragem,
      @JsonKey(name: "veiculo_id") required this.veiculoId});

  factory _$ConsumoVeiculoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumoVeiculoModelImplFromJson(json);

  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final int? id;
  @override
  final double litros;
  @override
  @JsonKey(name: "preco_total")
  final double precoTotal;
  @override
  final int kilometragem;
  @override
  @JsonKey(name: "veiculo_id")
  final int veiculoId;

  @override
  String toString() {
    return 'ConsumoVeiculoModel(id: $id, litros: $litros, precoTotal: $precoTotal, kilometragem: $kilometragem, veiculoId: $veiculoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumoVeiculoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.litros, litros) || other.litros == litros) &&
            (identical(other.precoTotal, precoTotal) ||
                other.precoTotal == precoTotal) &&
            (identical(other.kilometragem, kilometragem) ||
                other.kilometragem == kilometragem) &&
            (identical(other.veiculoId, veiculoId) ||
                other.veiculoId == veiculoId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, litros, precoTotal, kilometragem, veiculoId);

  /// Create a copy of ConsumoVeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumoVeiculoModelImplCopyWith<_$ConsumoVeiculoModelImpl> get copyWith =>
      __$$ConsumoVeiculoModelImplCopyWithImpl<_$ConsumoVeiculoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumoVeiculoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsumoVeiculoModel implements ConsumoVeiculoModel {
  factory _ConsumoVeiculoModel(
          {@JsonKey(includeToJson: false, includeFromJson: true)
          required final int? id,
          required final double litros,
          @JsonKey(name: "preco_total") required final double precoTotal,
          required final int kilometragem,
          @JsonKey(name: "veiculo_id") required final int veiculoId}) =
      _$ConsumoVeiculoModelImpl;

  factory _ConsumoVeiculoModel.fromJson(Map<String, dynamic> json) =
      _$ConsumoVeiculoModelImpl.fromJson;

  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  int? get id;
  @override
  double get litros;
  @override
  @JsonKey(name: "preco_total")
  double get precoTotal;
  @override
  int get kilometragem;
  @override
  @JsonKey(name: "veiculo_id")
  int get veiculoId;

  /// Create a copy of ConsumoVeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsumoVeiculoModelImplCopyWith<_$ConsumoVeiculoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
