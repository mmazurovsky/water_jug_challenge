// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InputsTearOff {
  const _$InputsTearOff();

  _Inputs call(
      {required int xMaxVolume,
      required int yMaxVolume,
      required int zWantedVolume}) {
    return _Inputs(
      xMaxVolume: xMaxVolume,
      yMaxVolume: yMaxVolume,
      zWantedVolume: zWantedVolume,
    );
  }
}

/// @nodoc
const $Inputs = _$InputsTearOff();

/// @nodoc
mixin _$Inputs {
  int get xMaxVolume => throw _privateConstructorUsedError;
  int get yMaxVolume => throw _privateConstructorUsedError;
  int get zWantedVolume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InputsCopyWith<Inputs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputsCopyWith<$Res> {
  factory $InputsCopyWith(Inputs value, $Res Function(Inputs) then) =
      _$InputsCopyWithImpl<$Res>;
  $Res call({int xMaxVolume, int yMaxVolume, int zWantedVolume});
}

/// @nodoc
class _$InputsCopyWithImpl<$Res> implements $InputsCopyWith<$Res> {
  _$InputsCopyWithImpl(this._value, this._then);

  final Inputs _value;
  // ignore: unused_field
  final $Res Function(Inputs) _then;

  @override
  $Res call({
    Object? xMaxVolume = freezed,
    Object? yMaxVolume = freezed,
    Object? zWantedVolume = freezed,
  }) {
    return _then(_value.copyWith(
      xMaxVolume: xMaxVolume == freezed
          ? _value.xMaxVolume
          : xMaxVolume // ignore: cast_nullable_to_non_nullable
              as int,
      yMaxVolume: yMaxVolume == freezed
          ? _value.yMaxVolume
          : yMaxVolume // ignore: cast_nullable_to_non_nullable
              as int,
      zWantedVolume: zWantedVolume == freezed
          ? _value.zWantedVolume
          : zWantedVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$InputsCopyWith<$Res> implements $InputsCopyWith<$Res> {
  factory _$InputsCopyWith(_Inputs value, $Res Function(_Inputs) then) =
      __$InputsCopyWithImpl<$Res>;
  @override
  $Res call({int xMaxVolume, int yMaxVolume, int zWantedVolume});
}

/// @nodoc
class __$InputsCopyWithImpl<$Res> extends _$InputsCopyWithImpl<$Res>
    implements _$InputsCopyWith<$Res> {
  __$InputsCopyWithImpl(_Inputs _value, $Res Function(_Inputs) _then)
      : super(_value, (v) => _then(v as _Inputs));

  @override
  _Inputs get _value => super._value as _Inputs;

  @override
  $Res call({
    Object? xMaxVolume = freezed,
    Object? yMaxVolume = freezed,
    Object? zWantedVolume = freezed,
  }) {
    return _then(_Inputs(
      xMaxVolume: xMaxVolume == freezed
          ? _value.xMaxVolume
          : xMaxVolume // ignore: cast_nullable_to_non_nullable
              as int,
      yMaxVolume: yMaxVolume == freezed
          ? _value.yMaxVolume
          : yMaxVolume // ignore: cast_nullable_to_non_nullable
              as int,
      zWantedVolume: zWantedVolume == freezed
          ? _value.zWantedVolume
          : zWantedVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Inputs implements _Inputs {
  _$_Inputs(
      {required this.xMaxVolume,
      required this.yMaxVolume,
      required this.zWantedVolume});

  @override
  final int xMaxVolume;
  @override
  final int yMaxVolume;
  @override
  final int zWantedVolume;

  @override
  String toString() {
    return 'Inputs(xMaxVolume: $xMaxVolume, yMaxVolume: $yMaxVolume, zWantedVolume: $zWantedVolume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Inputs &&
            const DeepCollectionEquality()
                .equals(other.xMaxVolume, xMaxVolume) &&
            const DeepCollectionEquality()
                .equals(other.yMaxVolume, yMaxVolume) &&
            const DeepCollectionEquality()
                .equals(other.zWantedVolume, zWantedVolume));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(xMaxVolume),
      const DeepCollectionEquality().hash(yMaxVolume),
      const DeepCollectionEquality().hash(zWantedVolume));

  @JsonKey(ignore: true)
  @override
  _$InputsCopyWith<_Inputs> get copyWith =>
      __$InputsCopyWithImpl<_Inputs>(this, _$identity);
}

abstract class _Inputs implements Inputs {
  factory _Inputs(
      {required int xMaxVolume,
      required int yMaxVolume,
      required int zWantedVolume}) = _$_Inputs;

  @override
  int get xMaxVolume;
  @override
  int get yMaxVolume;
  @override
  int get zWantedVolume;
  @override
  @JsonKey(ignore: true)
  _$InputsCopyWith<_Inputs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BucketsStateTearOff {
  const _$BucketsStateTearOff();

  _BucketsState call(int xFilledVolume, int yFilledVolume) {
    return _BucketsState(
      xFilledVolume,
      yFilledVolume,
    );
  }
}

/// @nodoc
const $BucketsState = _$BucketsStateTearOff();

/// @nodoc
mixin _$BucketsState {
  int get xFilledVolume => throw _privateConstructorUsedError;
  int get yFilledVolume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BucketsStateCopyWith<BucketsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BucketsStateCopyWith<$Res> {
  factory $BucketsStateCopyWith(
          BucketsState value, $Res Function(BucketsState) then) =
      _$BucketsStateCopyWithImpl<$Res>;
  $Res call({int xFilledVolume, int yFilledVolume});
}

/// @nodoc
class _$BucketsStateCopyWithImpl<$Res> implements $BucketsStateCopyWith<$Res> {
  _$BucketsStateCopyWithImpl(this._value, this._then);

  final BucketsState _value;
  // ignore: unused_field
  final $Res Function(BucketsState) _then;

  @override
  $Res call({
    Object? xFilledVolume = freezed,
    Object? yFilledVolume = freezed,
  }) {
    return _then(_value.copyWith(
      xFilledVolume: xFilledVolume == freezed
          ? _value.xFilledVolume
          : xFilledVolume // ignore: cast_nullable_to_non_nullable
              as int,
      yFilledVolume: yFilledVolume == freezed
          ? _value.yFilledVolume
          : yFilledVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BucketsStateCopyWith<$Res>
    implements $BucketsStateCopyWith<$Res> {
  factory _$BucketsStateCopyWith(
          _BucketsState value, $Res Function(_BucketsState) then) =
      __$BucketsStateCopyWithImpl<$Res>;
  @override
  $Res call({int xFilledVolume, int yFilledVolume});
}

/// @nodoc
class __$BucketsStateCopyWithImpl<$Res> extends _$BucketsStateCopyWithImpl<$Res>
    implements _$BucketsStateCopyWith<$Res> {
  __$BucketsStateCopyWithImpl(
      _BucketsState _value, $Res Function(_BucketsState) _then)
      : super(_value, (v) => _then(v as _BucketsState));

  @override
  _BucketsState get _value => super._value as _BucketsState;

  @override
  $Res call({
    Object? xFilledVolume = freezed,
    Object? yFilledVolume = freezed,
  }) {
    return _then(_BucketsState(
      xFilledVolume == freezed
          ? _value.xFilledVolume
          : xFilledVolume // ignore: cast_nullable_to_non_nullable
              as int,
      yFilledVolume == freezed
          ? _value.yFilledVolume
          : yFilledVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BucketsState implements _BucketsState {
  _$_BucketsState(this.xFilledVolume, this.yFilledVolume);

  @override
  final int xFilledVolume;
  @override
  final int yFilledVolume;

  @override
  String toString() {
    return 'BucketsState(xFilledVolume: $xFilledVolume, yFilledVolume: $yFilledVolume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BucketsState &&
            const DeepCollectionEquality()
                .equals(other.xFilledVolume, xFilledVolume) &&
            const DeepCollectionEquality()
                .equals(other.yFilledVolume, yFilledVolume));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(xFilledVolume),
      const DeepCollectionEquality().hash(yFilledVolume));

  @JsonKey(ignore: true)
  @override
  _$BucketsStateCopyWith<_BucketsState> get copyWith =>
      __$BucketsStateCopyWithImpl<_BucketsState>(this, _$identity);
}

abstract class _BucketsState implements BucketsState {
  factory _BucketsState(int xFilledVolume, int yFilledVolume) = _$_BucketsState;

  @override
  int get xFilledVolume;
  @override
  int get yFilledVolume;
  @override
  @JsonKey(ignore: true)
  _$BucketsStateCopyWith<_BucketsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BucketsStepStateTearOff {
  const _$BucketsStepStateTearOff();

  _StepState call(
      {required BucketsState bucketsState,
      required BucketAction action,
      required Bucket actionInitializer}) {
    return _StepState(
      bucketsState: bucketsState,
      action: action,
      actionInitializer: actionInitializer,
    );
  }
}

/// @nodoc
const $BucketsStepState = _$BucketsStepStateTearOff();

/// @nodoc
mixin _$BucketsStepState {
  BucketsState get bucketsState => throw _privateConstructorUsedError;
  BucketAction get action => throw _privateConstructorUsedError;
  Bucket get actionInitializer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BucketsStepStateCopyWith<BucketsStepState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BucketsStepStateCopyWith<$Res> {
  factory $BucketsStepStateCopyWith(
          BucketsStepState value, $Res Function(BucketsStepState) then) =
      _$BucketsStepStateCopyWithImpl<$Res>;
  $Res call(
      {BucketsState bucketsState, BucketAction action, Bucket actionInitializer});

  $BucketsStateCopyWith<$Res> get bucketsState;
}

/// @nodoc
class _$BucketsStepStateCopyWithImpl<$Res>
    implements $BucketsStepStateCopyWith<$Res> {
  _$BucketsStepStateCopyWithImpl(this._value, this._then);

  final BucketsStepState _value;
  // ignore: unused_field
  final $Res Function(BucketsStepState) _then;

  @override
  $Res call({
    Object? bucketsState = freezed,
    Object? action = freezed,
    Object? actionInitializer = freezed,
  }) {
    return _then(_value.copyWith(
      bucketsState: bucketsState == freezed
          ? _value.bucketsState
          : bucketsState // ignore: cast_nullable_to_non_nullable
              as BucketsState,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BucketAction,
      actionInitializer: actionInitializer == freezed
          ? _value.actionInitializer
          : actionInitializer // ignore: cast_nullable_to_non_nullable
              as Bucket,
    ));
  }

  @override
  $BucketsStateCopyWith<$Res> get bucketsState {
    return $BucketsStateCopyWith<$Res>(_value.bucketsState, (value) {
      return _then(_value.copyWith(bucketsState: value));
    });
  }
}

/// @nodoc
abstract class _$StepStateCopyWith<$Res>
    implements $BucketsStepStateCopyWith<$Res> {
  factory _$StepStateCopyWith(
          _StepState value, $Res Function(_StepState) then) =
      __$StepStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {BucketsState bucketsState, BucketAction action, Bucket actionInitializer});

  @override
  $BucketsStateCopyWith<$Res> get bucketsState;
}

/// @nodoc
class __$StepStateCopyWithImpl<$Res>
    extends _$BucketsStepStateCopyWithImpl<$Res>
    implements _$StepStateCopyWith<$Res> {
  __$StepStateCopyWithImpl(_StepState _value, $Res Function(_StepState) _then)
      : super(_value, (v) => _then(v as _StepState));

  @override
  _StepState get _value => super._value as _StepState;

  @override
  $Res call({
    Object? bucketsState = freezed,
    Object? action = freezed,
    Object? actionInitializer = freezed,
  }) {
    return _then(_StepState(
      bucketsState: bucketsState == freezed
          ? _value.bucketsState
          : bucketsState // ignore: cast_nullable_to_non_nullable
              as BucketsState,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BucketAction,
      actionInitializer: actionInitializer == freezed
          ? _value.actionInitializer
          : actionInitializer // ignore: cast_nullable_to_non_nullable
              as Bucket,
    ));
  }
}

/// @nodoc

class _$_StepState extends _StepState {
  _$_StepState(
      {required this.bucketsState,
      required this.action,
      required this.actionInitializer})
      : super._();

  @override
  final BucketsState bucketsState;
  @override
  final BucketAction action;
  @override
  final Bucket actionInitializer;

  @override
  String toString() {
    return 'BucketsStepState(bucketsState: $bucketsState, action: $action, actionInitializer: $actionInitializer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StepState &&
            const DeepCollectionEquality()
                .equals(other.bucketsState, bucketsState) &&
            const DeepCollectionEquality().equals(other.action, action) &&
            const DeepCollectionEquality()
                .equals(other.actionInitializer, actionInitializer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bucketsState),
      const DeepCollectionEquality().hash(action),
      const DeepCollectionEquality().hash(actionInitializer));

  @JsonKey(ignore: true)
  @override
  _$StepStateCopyWith<_StepState> get copyWith =>
      __$StepStateCopyWithImpl<_StepState>(this, _$identity);
}

abstract class _StepState extends BucketsStepState {
  factory _StepState(
      {required BucketsState bucketsState,
      required BucketAction action,
      required Bucket actionInitializer}) = _$_StepState;
  _StepState._() : super._();

  @override
  BucketsState get bucketsState;
  @override
  BucketAction get action;
  @override
  Bucket get actionInitializer;
  @override
  @JsonKey(ignore: true)
  _$StepStateCopyWith<_StepState> get copyWith =>
      throw _privateConstructorUsedError;
}
