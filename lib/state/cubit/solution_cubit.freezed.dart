// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'solution_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SolutionStateTearOff {
  const _$SolutionStateTearOff();

  _LoadingSolution loading() {
    return const _LoadingSolution();
  }

  _LoadedSolution loaded(List<BucketsStepState> steps) {
    return _LoadedSolution(
      steps,
    );
  }

  _ErrorSolution error(String message) {
    return _ErrorSolution(
      message,
    );
  }
}

/// @nodoc
const $SolutionState = _$SolutionStateTearOff();

/// @nodoc
mixin _$SolutionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<BucketsStepState> steps) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSolution value) loading,
    required TResult Function(_LoadedSolution value) loaded,
    required TResult Function(_ErrorSolution value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolutionStateCopyWith<$Res> {
  factory $SolutionStateCopyWith(
          SolutionState value, $Res Function(SolutionState) then) =
      _$SolutionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SolutionStateCopyWithImpl<$Res>
    implements $SolutionStateCopyWith<$Res> {
  _$SolutionStateCopyWithImpl(this._value, this._then);

  final SolutionState _value;
  // ignore: unused_field
  final $Res Function(SolutionState) _then;
}

/// @nodoc
abstract class _$LoadingSolutionCopyWith<$Res> {
  factory _$LoadingSolutionCopyWith(
          _LoadingSolution value, $Res Function(_LoadingSolution) then) =
      __$LoadingSolutionCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingSolutionCopyWithImpl<$Res>
    extends _$SolutionStateCopyWithImpl<$Res>
    implements _$LoadingSolutionCopyWith<$Res> {
  __$LoadingSolutionCopyWithImpl(
      _LoadingSolution _value, $Res Function(_LoadingSolution) _then)
      : super(_value, (v) => _then(v as _LoadingSolution));

  @override
  _LoadingSolution get _value => super._value as _LoadingSolution;
}

/// @nodoc

class _$_LoadingSolution implements _LoadingSolution {
  const _$_LoadingSolution();

  @override
  String toString() {
    return 'SolutionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadingSolution);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<BucketsStepState> steps) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSolution value) loading,
    required TResult Function(_LoadedSolution value) loaded,
    required TResult Function(_ErrorSolution value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingSolution implements SolutionState {
  const factory _LoadingSolution() = _$_LoadingSolution;
}

/// @nodoc
abstract class _$LoadedSolutionCopyWith<$Res> {
  factory _$LoadedSolutionCopyWith(
          _LoadedSolution value, $Res Function(_LoadedSolution) then) =
      __$LoadedSolutionCopyWithImpl<$Res>;
  $Res call({List<BucketsStepState> steps});
}

/// @nodoc
class __$LoadedSolutionCopyWithImpl<$Res>
    extends _$SolutionStateCopyWithImpl<$Res>
    implements _$LoadedSolutionCopyWith<$Res> {
  __$LoadedSolutionCopyWithImpl(
      _LoadedSolution _value, $Res Function(_LoadedSolution) _then)
      : super(_value, (v) => _then(v as _LoadedSolution));

  @override
  _LoadedSolution get _value => super._value as _LoadedSolution;

  @override
  $Res call({
    Object? steps = freezed,
  }) {
    return _then(_LoadedSolution(
      steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<BucketsStepState>,
    ));
  }
}

/// @nodoc

class _$_LoadedSolution implements _LoadedSolution {
  const _$_LoadedSolution(this.steps);

  @override
  final List<BucketsStepState> steps;

  @override
  String toString() {
    return 'SolutionState.loaded(steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadedSolution &&
            const DeepCollectionEquality().equals(other.steps, steps));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(steps));

  @JsonKey(ignore: true)
  @override
  _$LoadedSolutionCopyWith<_LoadedSolution> get copyWith =>
      __$LoadedSolutionCopyWithImpl<_LoadedSolution>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<BucketsStepState> steps) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(steps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(steps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(steps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSolution value) loading,
    required TResult Function(_LoadedSolution value) loaded,
    required TResult Function(_ErrorSolution value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedSolution implements SolutionState {
  const factory _LoadedSolution(List<BucketsStepState> steps) =
      _$_LoadedSolution;

  List<BucketsStepState> get steps;
  @JsonKey(ignore: true)
  _$LoadedSolutionCopyWith<_LoadedSolution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorSolutionCopyWith<$Res> {
  factory _$ErrorSolutionCopyWith(
          _ErrorSolution value, $Res Function(_ErrorSolution) then) =
      __$ErrorSolutionCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorSolutionCopyWithImpl<$Res>
    extends _$SolutionStateCopyWithImpl<$Res>
    implements _$ErrorSolutionCopyWith<$Res> {
  __$ErrorSolutionCopyWithImpl(
      _ErrorSolution _value, $Res Function(_ErrorSolution) _then)
      : super(_value, (v) => _then(v as _ErrorSolution));

  @override
  _ErrorSolution get _value => super._value as _ErrorSolution;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ErrorSolution(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorSolution implements _ErrorSolution {
  const _$_ErrorSolution(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SolutionState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorSolution &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$ErrorSolutionCopyWith<_ErrorSolution> get copyWith =>
      __$ErrorSolutionCopyWithImpl<_ErrorSolution>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<BucketsStepState> steps) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<BucketsStepState> steps)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSolution value) loading,
    required TResult Function(_LoadedSolution value) loaded,
    required TResult Function(_ErrorSolution value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSolution value)? loading,
    TResult Function(_LoadedSolution value)? loaded,
    TResult Function(_ErrorSolution value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorSolution implements SolutionState {
  const factory _ErrorSolution(String message) = _$_ErrorSolution;

  String get message;
  @JsonKey(ignore: true)
  _$ErrorSolutionCopyWith<_ErrorSolution> get copyWith =>
      throw _privateConstructorUsedError;
}
