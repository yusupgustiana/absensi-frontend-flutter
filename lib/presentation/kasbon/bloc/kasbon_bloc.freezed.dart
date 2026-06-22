// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kasbon_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KasbonEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) historyKasbon,
    required TResult Function() historyKasbonAdmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? historyKasbon,
    TResult? Function()? historyKasbonAdmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? historyKasbon,
    TResult Function()? historyKasbonAdmin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistoryKasbon value) historyKasbon,
    required TResult Function(_GetHistoryKasbonAdmin value) historyKasbonAdmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistoryKasbon value)? historyKasbon,
    TResult? Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistoryKasbon value)? historyKasbon,
    TResult Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KasbonEventCopyWith<$Res> {
  factory $KasbonEventCopyWith(
          KasbonEvent value, $Res Function(KasbonEvent) then) =
      _$KasbonEventCopyWithImpl<$Res, KasbonEvent>;
}

/// @nodoc
class _$KasbonEventCopyWithImpl<$Res, $Val extends KasbonEvent>
    implements $KasbonEventCopyWith<$Res> {
  _$KasbonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KasbonEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$KasbonEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'KasbonEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) historyKasbon,
    required TResult Function() historyKasbonAdmin,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? historyKasbon,
    TResult? Function()? historyKasbonAdmin,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? historyKasbon,
    TResult Function()? historyKasbonAdmin,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistoryKasbon value) historyKasbon,
    required TResult Function(_GetHistoryKasbonAdmin value) historyKasbonAdmin,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistoryKasbon value)? historyKasbon,
    TResult? Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistoryKasbon value)? historyKasbon,
    TResult Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements KasbonEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetHistoryKasbonImplCopyWith<$Res> {
  factory _$$GetHistoryKasbonImplCopyWith(_$GetHistoryKasbonImpl value,
          $Res Function(_$GetHistoryKasbonImpl) then) =
      __$$GetHistoryKasbonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String idUser});
}

/// @nodoc
class __$$GetHistoryKasbonImplCopyWithImpl<$Res>
    extends _$KasbonEventCopyWithImpl<$Res, _$GetHistoryKasbonImpl>
    implements _$$GetHistoryKasbonImplCopyWith<$Res> {
  __$$GetHistoryKasbonImplCopyWithImpl(_$GetHistoryKasbonImpl _value,
      $Res Function(_$GetHistoryKasbonImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
  }) {
    return _then(_$GetHistoryKasbonImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetHistoryKasbonImpl implements _GetHistoryKasbon {
  const _$GetHistoryKasbonImpl({required this.idUser});

  @override
  final String idUser;

  @override
  String toString() {
    return 'KasbonEvent.historyKasbon(idUser: $idUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHistoryKasbonImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idUser);

  /// Create a copy of KasbonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHistoryKasbonImplCopyWith<_$GetHistoryKasbonImpl> get copyWith =>
      __$$GetHistoryKasbonImplCopyWithImpl<_$GetHistoryKasbonImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) historyKasbon,
    required TResult Function() historyKasbonAdmin,
  }) {
    return historyKasbon(idUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? historyKasbon,
    TResult? Function()? historyKasbonAdmin,
  }) {
    return historyKasbon?.call(idUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? historyKasbon,
    TResult Function()? historyKasbonAdmin,
    required TResult orElse(),
  }) {
    if (historyKasbon != null) {
      return historyKasbon(idUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistoryKasbon value) historyKasbon,
    required TResult Function(_GetHistoryKasbonAdmin value) historyKasbonAdmin,
  }) {
    return historyKasbon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistoryKasbon value)? historyKasbon,
    TResult? Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
  }) {
    return historyKasbon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistoryKasbon value)? historyKasbon,
    TResult Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
    required TResult orElse(),
  }) {
    if (historyKasbon != null) {
      return historyKasbon(this);
    }
    return orElse();
  }
}

abstract class _GetHistoryKasbon implements KasbonEvent {
  const factory _GetHistoryKasbon({required final String idUser}) =
      _$GetHistoryKasbonImpl;

  String get idUser;

  /// Create a copy of KasbonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHistoryKasbonImplCopyWith<_$GetHistoryKasbonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetHistoryKasbonAdminImplCopyWith<$Res> {
  factory _$$GetHistoryKasbonAdminImplCopyWith(
          _$GetHistoryKasbonAdminImpl value,
          $Res Function(_$GetHistoryKasbonAdminImpl) then) =
      __$$GetHistoryKasbonAdminImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHistoryKasbonAdminImplCopyWithImpl<$Res>
    extends _$KasbonEventCopyWithImpl<$Res, _$GetHistoryKasbonAdminImpl>
    implements _$$GetHistoryKasbonAdminImplCopyWith<$Res> {
  __$$GetHistoryKasbonAdminImplCopyWithImpl(_$GetHistoryKasbonAdminImpl _value,
      $Res Function(_$GetHistoryKasbonAdminImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHistoryKasbonAdminImpl implements _GetHistoryKasbonAdmin {
  const _$GetHistoryKasbonAdminImpl();

  @override
  String toString() {
    return 'KasbonEvent.historyKasbonAdmin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHistoryKasbonAdminImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) historyKasbon,
    required TResult Function() historyKasbonAdmin,
  }) {
    return historyKasbonAdmin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? historyKasbon,
    TResult? Function()? historyKasbonAdmin,
  }) {
    return historyKasbonAdmin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? historyKasbon,
    TResult Function()? historyKasbonAdmin,
    required TResult orElse(),
  }) {
    if (historyKasbonAdmin != null) {
      return historyKasbonAdmin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistoryKasbon value) historyKasbon,
    required TResult Function(_GetHistoryKasbonAdmin value) historyKasbonAdmin,
  }) {
    return historyKasbonAdmin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistoryKasbon value)? historyKasbon,
    TResult? Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
  }) {
    return historyKasbonAdmin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistoryKasbon value)? historyKasbon,
    TResult Function(_GetHistoryKasbonAdmin value)? historyKasbonAdmin,
    required TResult orElse(),
  }) {
    if (historyKasbonAdmin != null) {
      return historyKasbonAdmin(this);
    }
    return orElse();
  }
}

abstract class _GetHistoryKasbonAdmin implements KasbonEvent {
  const factory _GetHistoryKasbonAdmin() = _$GetHistoryKasbonAdminImpl;
}

/// @nodoc
mixin _$KasbonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DetailHistoryKasbon> detail) loaded,
    required TResult Function(List<DetailHistoryKasbon> detail)
        loadhistoryadmin,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult? Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedHistoryAdmin value) loadhistoryadmin,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KasbonStateCopyWith<$Res> {
  factory $KasbonStateCopyWith(
          KasbonState value, $Res Function(KasbonState) then) =
      _$KasbonStateCopyWithImpl<$Res, KasbonState>;
}

/// @nodoc
class _$KasbonStateCopyWithImpl<$Res, $Val extends KasbonState>
    implements $KasbonStateCopyWith<$Res> {
  _$KasbonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$KasbonStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'KasbonState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DetailHistoryKasbon> detail) loaded,
    required TResult Function(List<DetailHistoryKasbon> detail)
        loadhistoryadmin,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult? Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedHistoryAdmin value) loadhistoryadmin,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements KasbonState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$KasbonStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'KasbonState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DetailHistoryKasbon> detail) loaded,
    required TResult Function(List<DetailHistoryKasbon> detail)
        loadhistoryadmin,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult? Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedHistoryAdmin value) loadhistoryadmin,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements KasbonState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DetailHistoryKasbon> detail});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$KasbonStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
  }) {
    return _then(_$LoadedImpl(
      null == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<DetailHistoryKasbon>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<DetailHistoryKasbon> detail) : _detail = detail;

  final List<DetailHistoryKasbon> _detail;
  @override
  List<DetailHistoryKasbon> get detail {
    if (_detail is EqualUnmodifiableListView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detail);
  }

  @override
  String toString() {
    return 'KasbonState.loaded(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_detail));

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DetailHistoryKasbon> detail) loaded,
    required TResult Function(List<DetailHistoryKasbon> detail)
        loadhistoryadmin,
    required TResult Function(String message) error,
  }) {
    return loaded(detail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult? Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(detail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedHistoryAdmin value) loadhistoryadmin,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements KasbonState {
  const factory _Loaded(final List<DetailHistoryKasbon> detail) = _$LoadedImpl;

  List<DetailHistoryKasbon> get detail;

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedHistoryAdminImplCopyWith<$Res> {
  factory _$$LoadedHistoryAdminImplCopyWith(_$LoadedHistoryAdminImpl value,
          $Res Function(_$LoadedHistoryAdminImpl) then) =
      __$$LoadedHistoryAdminImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DetailHistoryKasbon> detail});
}

/// @nodoc
class __$$LoadedHistoryAdminImplCopyWithImpl<$Res>
    extends _$KasbonStateCopyWithImpl<$Res, _$LoadedHistoryAdminImpl>
    implements _$$LoadedHistoryAdminImplCopyWith<$Res> {
  __$$LoadedHistoryAdminImplCopyWithImpl(_$LoadedHistoryAdminImpl _value,
      $Res Function(_$LoadedHistoryAdminImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
  }) {
    return _then(_$LoadedHistoryAdminImpl(
      null == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<DetailHistoryKasbon>,
    ));
  }
}

/// @nodoc

class _$LoadedHistoryAdminImpl implements _LoadedHistoryAdmin {
  const _$LoadedHistoryAdminImpl(final List<DetailHistoryKasbon> detail)
      : _detail = detail;

  final List<DetailHistoryKasbon> _detail;
  @override
  List<DetailHistoryKasbon> get detail {
    if (_detail is EqualUnmodifiableListView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detail);
  }

  @override
  String toString() {
    return 'KasbonState.loadhistoryadmin(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedHistoryAdminImpl &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_detail));

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedHistoryAdminImplCopyWith<_$LoadedHistoryAdminImpl> get copyWith =>
      __$$LoadedHistoryAdminImplCopyWithImpl<_$LoadedHistoryAdminImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DetailHistoryKasbon> detail) loaded,
    required TResult Function(List<DetailHistoryKasbon> detail)
        loadhistoryadmin,
    required TResult Function(String message) error,
  }) {
    return loadhistoryadmin(detail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult? Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult? Function(String message)? error,
  }) {
    return loadhistoryadmin?.call(detail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadhistoryadmin != null) {
      return loadhistoryadmin(detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedHistoryAdmin value) loadhistoryadmin,
    required TResult Function(_Error value) error,
  }) {
    return loadhistoryadmin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult? Function(_Error value)? error,
  }) {
    return loadhistoryadmin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadhistoryadmin != null) {
      return loadhistoryadmin(this);
    }
    return orElse();
  }
}

abstract class _LoadedHistoryAdmin implements KasbonState {
  const factory _LoadedHistoryAdmin(final List<DetailHistoryKasbon> detail) =
      _$LoadedHistoryAdminImpl;

  List<DetailHistoryKasbon> get detail;

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedHistoryAdminImplCopyWith<_$LoadedHistoryAdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$KasbonStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'KasbonState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DetailHistoryKasbon> detail) loaded,
    required TResult Function(List<DetailHistoryKasbon> detail)
        loadhistoryadmin,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult? Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DetailHistoryKasbon> detail)? loaded,
    TResult Function(List<DetailHistoryKasbon> detail)? loadhistoryadmin,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedHistoryAdmin value) loadhistoryadmin,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedHistoryAdmin value)? loadhistoryadmin,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements KasbonState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of KasbonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
