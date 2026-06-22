// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) requestForgotPassword,
    required TResult Function(String token) requestVerifyToken,
    required TResult Function(String token, String newPassword)
        requestResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? requestForgotPassword,
    TResult? Function(String token)? requestVerifyToken,
    TResult? Function(String token, String newPassword)? requestResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? requestForgotPassword,
    TResult Function(String token)? requestVerifyToken,
    TResult Function(String token, String newPassword)? requestResetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RequestForgotPassword value)
        requestForgotPassword,
    required TResult Function(_RequestVerifyToken value) requestVerifyToken,
    required TResult Function(_RequestResetPassword value) requestResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult? Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult? Function(_RequestResetPassword value)? requestResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult Function(_RequestResetPassword value)? requestResetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordEvent
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
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ForgotPasswordEvent.started'));
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
    required TResult Function(String email) requestForgotPassword,
    required TResult Function(String token) requestVerifyToken,
    required TResult Function(String token, String newPassword)
        requestResetPassword,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? requestForgotPassword,
    TResult? Function(String token)? requestVerifyToken,
    TResult? Function(String token, String newPassword)? requestResetPassword,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? requestForgotPassword,
    TResult Function(String token)? requestVerifyToken,
    TResult Function(String token, String newPassword)? requestResetPassword,
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
    required TResult Function(_RequestForgotPassword value)
        requestForgotPassword,
    required TResult Function(_RequestVerifyToken value) requestVerifyToken,
    required TResult Function(_RequestResetPassword value) requestResetPassword,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult? Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult? Function(_RequestResetPassword value)? requestResetPassword,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult Function(_RequestResetPassword value)? requestResetPassword,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ForgotPasswordEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RequestForgotPasswordImplCopyWith<$Res> {
  factory _$$RequestForgotPasswordImplCopyWith(
          _$RequestForgotPasswordImpl value,
          $Res Function(_$RequestForgotPasswordImpl) then) =
      __$$RequestForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$RequestForgotPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$RequestForgotPasswordImpl>
    implements _$$RequestForgotPasswordImplCopyWith<$Res> {
  __$$RequestForgotPasswordImplCopyWithImpl(_$RequestForgotPasswordImpl _value,
      $Res Function(_$RequestForgotPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$RequestForgotPasswordImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RequestForgotPasswordImpl
    with DiagnosticableTreeMixin
    implements _RequestForgotPassword {
  const _$RequestForgotPasswordImpl(this.email);

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.requestForgotPassword(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ForgotPasswordEvent.requestForgotPassword'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestForgotPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestForgotPasswordImplCopyWith<_$RequestForgotPasswordImpl>
      get copyWith => __$$RequestForgotPasswordImplCopyWithImpl<
          _$RequestForgotPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) requestForgotPassword,
    required TResult Function(String token) requestVerifyToken,
    required TResult Function(String token, String newPassword)
        requestResetPassword,
  }) {
    return requestForgotPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? requestForgotPassword,
    TResult? Function(String token)? requestVerifyToken,
    TResult? Function(String token, String newPassword)? requestResetPassword,
  }) {
    return requestForgotPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? requestForgotPassword,
    TResult Function(String token)? requestVerifyToken,
    TResult Function(String token, String newPassword)? requestResetPassword,
    required TResult orElse(),
  }) {
    if (requestForgotPassword != null) {
      return requestForgotPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RequestForgotPassword value)
        requestForgotPassword,
    required TResult Function(_RequestVerifyToken value) requestVerifyToken,
    required TResult Function(_RequestResetPassword value) requestResetPassword,
  }) {
    return requestForgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult? Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult? Function(_RequestResetPassword value)? requestResetPassword,
  }) {
    return requestForgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult Function(_RequestResetPassword value)? requestResetPassword,
    required TResult orElse(),
  }) {
    if (requestForgotPassword != null) {
      return requestForgotPassword(this);
    }
    return orElse();
  }
}

abstract class _RequestForgotPassword implements ForgotPasswordEvent {
  const factory _RequestForgotPassword(final String email) =
      _$RequestForgotPasswordImpl;

  String get email;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestForgotPasswordImplCopyWith<_$RequestForgotPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestVerifyTokenImplCopyWith<$Res> {
  factory _$$RequestVerifyTokenImplCopyWith(_$RequestVerifyTokenImpl value,
          $Res Function(_$RequestVerifyTokenImpl) then) =
      __$$RequestVerifyTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$RequestVerifyTokenImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$RequestVerifyTokenImpl>
    implements _$$RequestVerifyTokenImplCopyWith<$Res> {
  __$$RequestVerifyTokenImplCopyWithImpl(_$RequestVerifyTokenImpl _value,
      $Res Function(_$RequestVerifyTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$RequestVerifyTokenImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RequestVerifyTokenImpl
    with DiagnosticableTreeMixin
    implements _RequestVerifyToken {
  const _$RequestVerifyTokenImpl(this.token);

  @override
  final String token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.requestVerifyToken(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ForgotPasswordEvent.requestVerifyToken'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestVerifyTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestVerifyTokenImplCopyWith<_$RequestVerifyTokenImpl> get copyWith =>
      __$$RequestVerifyTokenImplCopyWithImpl<_$RequestVerifyTokenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) requestForgotPassword,
    required TResult Function(String token) requestVerifyToken,
    required TResult Function(String token, String newPassword)
        requestResetPassword,
  }) {
    return requestVerifyToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? requestForgotPassword,
    TResult? Function(String token)? requestVerifyToken,
    TResult? Function(String token, String newPassword)? requestResetPassword,
  }) {
    return requestVerifyToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? requestForgotPassword,
    TResult Function(String token)? requestVerifyToken,
    TResult Function(String token, String newPassword)? requestResetPassword,
    required TResult orElse(),
  }) {
    if (requestVerifyToken != null) {
      return requestVerifyToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RequestForgotPassword value)
        requestForgotPassword,
    required TResult Function(_RequestVerifyToken value) requestVerifyToken,
    required TResult Function(_RequestResetPassword value) requestResetPassword,
  }) {
    return requestVerifyToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult? Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult? Function(_RequestResetPassword value)? requestResetPassword,
  }) {
    return requestVerifyToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult Function(_RequestResetPassword value)? requestResetPassword,
    required TResult orElse(),
  }) {
    if (requestVerifyToken != null) {
      return requestVerifyToken(this);
    }
    return orElse();
  }
}

abstract class _RequestVerifyToken implements ForgotPasswordEvent {
  const factory _RequestVerifyToken(final String token) =
      _$RequestVerifyTokenImpl;

  String get token;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestVerifyTokenImplCopyWith<_$RequestVerifyTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestResetPasswordImplCopyWith<$Res> {
  factory _$$RequestResetPasswordImplCopyWith(_$RequestResetPasswordImpl value,
          $Res Function(_$RequestResetPasswordImpl) then) =
      __$$RequestResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class __$$RequestResetPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$RequestResetPasswordImpl>
    implements _$$RequestResetPasswordImplCopyWith<$Res> {
  __$$RequestResetPasswordImplCopyWithImpl(_$RequestResetPasswordImpl _value,
      $Res Function(_$RequestResetPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_$RequestResetPasswordImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RequestResetPasswordImpl
    with DiagnosticableTreeMixin
    implements _RequestResetPassword {
  const _$RequestResetPasswordImpl(this.token, this.newPassword);

  @override
  final String token;
  @override
  final String newPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.requestResetPassword(token: $token, newPassword: $newPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ForgotPasswordEvent.requestResetPassword'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('newPassword', newPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestResetPasswordImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, newPassword);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestResetPasswordImplCopyWith<_$RequestResetPasswordImpl>
      get copyWith =>
          __$$RequestResetPasswordImplCopyWithImpl<_$RequestResetPasswordImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) requestForgotPassword,
    required TResult Function(String token) requestVerifyToken,
    required TResult Function(String token, String newPassword)
        requestResetPassword,
  }) {
    return requestResetPassword(token, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? requestForgotPassword,
    TResult? Function(String token)? requestVerifyToken,
    TResult? Function(String token, String newPassword)? requestResetPassword,
  }) {
    return requestResetPassword?.call(token, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? requestForgotPassword,
    TResult Function(String token)? requestVerifyToken,
    TResult Function(String token, String newPassword)? requestResetPassword,
    required TResult orElse(),
  }) {
    if (requestResetPassword != null) {
      return requestResetPassword(token, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RequestForgotPassword value)
        requestForgotPassword,
    required TResult Function(_RequestVerifyToken value) requestVerifyToken,
    required TResult Function(_RequestResetPassword value) requestResetPassword,
  }) {
    return requestResetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult? Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult? Function(_RequestResetPassword value)? requestResetPassword,
  }) {
    return requestResetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RequestForgotPassword value)? requestForgotPassword,
    TResult Function(_RequestVerifyToken value)? requestVerifyToken,
    TResult Function(_RequestResetPassword value)? requestResetPassword,
    required TResult orElse(),
  }) {
    if (requestResetPassword != null) {
      return requestResetPassword(this);
    }
    return orElse();
  }
}

abstract class _RequestResetPassword implements ForgotPasswordEvent {
  const factory _RequestResetPassword(
          final String token, final String newPassword) =
      _$RequestResetPasswordImpl;

  String get token;
  String get newPassword;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestResetPasswordImplCopyWith<_$RequestResetPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiResponse<dynamic> email) loadForgotPassword,
    required TResult Function(ApiResponse<dynamic> token) loadVerifyToken,
    required TResult Function(ApiResponse<dynamic> token) resetPassword,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult? Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult? Function(ApiResponse<dynamic> token)? resetPassword,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult Function(ApiResponse<dynamic> token)? resetPassword,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadForgotPassword value) loadForgotPassword,
    required TResult Function(_LoadVerifyToken value) loadVerifyToken,
    required TResult Function(_LoadResetPassword value) resetPassword,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult? Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult? Function(_LoadResetPassword value)? resetPassword,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult Function(_LoadResetPassword value)? resetPassword,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordState
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ForgotPasswordState.initial'));
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
    required TResult Function(ApiResponse<dynamic> email) loadForgotPassword,
    required TResult Function(ApiResponse<dynamic> token) loadVerifyToken,
    required TResult Function(ApiResponse<dynamic> token) resetPassword,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult? Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult? Function(ApiResponse<dynamic> token)? resetPassword,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult Function(ApiResponse<dynamic> token)? resetPassword,
    TResult Function(String message)? failed,
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
    required TResult Function(_LoadForgotPassword value) loadForgotPassword,
    required TResult Function(_LoadVerifyToken value) loadVerifyToken,
    required TResult Function(_LoadResetPassword value) resetPassword,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult? Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult? Function(_LoadResetPassword value)? resetPassword,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult Function(_LoadResetPassword value)? resetPassword,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ForgotPasswordState {
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ForgotPasswordState.loading'));
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
    required TResult Function(ApiResponse<dynamic> email) loadForgotPassword,
    required TResult Function(ApiResponse<dynamic> token) loadVerifyToken,
    required TResult Function(ApiResponse<dynamic> token) resetPassword,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult? Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult? Function(ApiResponse<dynamic> token)? resetPassword,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult Function(ApiResponse<dynamic> token)? resetPassword,
    TResult Function(String message)? failed,
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
    required TResult Function(_LoadForgotPassword value) loadForgotPassword,
    required TResult Function(_LoadVerifyToken value) loadVerifyToken,
    required TResult Function(_LoadResetPassword value) resetPassword,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult? Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult? Function(_LoadResetPassword value)? resetPassword,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult Function(_LoadResetPassword value)? resetPassword,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ForgotPasswordState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadForgotPasswordImplCopyWith<$Res> {
  factory _$$LoadForgotPasswordImplCopyWith(_$LoadForgotPasswordImpl value,
          $Res Function(_$LoadForgotPasswordImpl) then) =
      __$$LoadForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiResponse<dynamic> email});
}

/// @nodoc
class __$$LoadForgotPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$LoadForgotPasswordImpl>
    implements _$$LoadForgotPasswordImplCopyWith<$Res> {
  __$$LoadForgotPasswordImplCopyWithImpl(_$LoadForgotPasswordImpl _value,
      $Res Function(_$LoadForgotPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$LoadForgotPasswordImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as ApiResponse<dynamic>,
    ));
  }
}

/// @nodoc

class _$LoadForgotPasswordImpl
    with DiagnosticableTreeMixin
    implements _LoadForgotPassword {
  const _$LoadForgotPasswordImpl(this.email);

  @override
  final ApiResponse<dynamic> email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.loadForgotPassword(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ForgotPasswordState.loadForgotPassword'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadForgotPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadForgotPasswordImplCopyWith<_$LoadForgotPasswordImpl> get copyWith =>
      __$$LoadForgotPasswordImplCopyWithImpl<_$LoadForgotPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiResponse<dynamic> email) loadForgotPassword,
    required TResult Function(ApiResponse<dynamic> token) loadVerifyToken,
    required TResult Function(ApiResponse<dynamic> token) resetPassword,
    required TResult Function(String message) failed,
  }) {
    return loadForgotPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult? Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult? Function(ApiResponse<dynamic> token)? resetPassword,
    TResult? Function(String message)? failed,
  }) {
    return loadForgotPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult Function(ApiResponse<dynamic> token)? resetPassword,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loadForgotPassword != null) {
      return loadForgotPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadForgotPassword value) loadForgotPassword,
    required TResult Function(_LoadVerifyToken value) loadVerifyToken,
    required TResult Function(_LoadResetPassword value) resetPassword,
    required TResult Function(_Failed value) failed,
  }) {
    return loadForgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult? Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult? Function(_LoadResetPassword value)? resetPassword,
    TResult? Function(_Failed value)? failed,
  }) {
    return loadForgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult Function(_LoadResetPassword value)? resetPassword,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loadForgotPassword != null) {
      return loadForgotPassword(this);
    }
    return orElse();
  }
}

abstract class _LoadForgotPassword implements ForgotPasswordState {
  const factory _LoadForgotPassword(final ApiResponse<dynamic> email) =
      _$LoadForgotPasswordImpl;

  ApiResponse<dynamic> get email;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadForgotPasswordImplCopyWith<_$LoadForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadVerifyTokenImplCopyWith<$Res> {
  factory _$$LoadVerifyTokenImplCopyWith(_$LoadVerifyTokenImpl value,
          $Res Function(_$LoadVerifyTokenImpl) then) =
      __$$LoadVerifyTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiResponse<dynamic> token});
}

/// @nodoc
class __$$LoadVerifyTokenImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$LoadVerifyTokenImpl>
    implements _$$LoadVerifyTokenImplCopyWith<$Res> {
  __$$LoadVerifyTokenImplCopyWithImpl(
      _$LoadVerifyTokenImpl _value, $Res Function(_$LoadVerifyTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$LoadVerifyTokenImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as ApiResponse<dynamic>,
    ));
  }
}

/// @nodoc

class _$LoadVerifyTokenImpl
    with DiagnosticableTreeMixin
    implements _LoadVerifyToken {
  const _$LoadVerifyTokenImpl(this.token);

  @override
  final ApiResponse<dynamic> token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.loadVerifyToken(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordState.loadVerifyToken'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadVerifyTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadVerifyTokenImplCopyWith<_$LoadVerifyTokenImpl> get copyWith =>
      __$$LoadVerifyTokenImplCopyWithImpl<_$LoadVerifyTokenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiResponse<dynamic> email) loadForgotPassword,
    required TResult Function(ApiResponse<dynamic> token) loadVerifyToken,
    required TResult Function(ApiResponse<dynamic> token) resetPassword,
    required TResult Function(String message) failed,
  }) {
    return loadVerifyToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult? Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult? Function(ApiResponse<dynamic> token)? resetPassword,
    TResult? Function(String message)? failed,
  }) {
    return loadVerifyToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult Function(ApiResponse<dynamic> token)? resetPassword,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loadVerifyToken != null) {
      return loadVerifyToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadForgotPassword value) loadForgotPassword,
    required TResult Function(_LoadVerifyToken value) loadVerifyToken,
    required TResult Function(_LoadResetPassword value) resetPassword,
    required TResult Function(_Failed value) failed,
  }) {
    return loadVerifyToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult? Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult? Function(_LoadResetPassword value)? resetPassword,
    TResult? Function(_Failed value)? failed,
  }) {
    return loadVerifyToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult Function(_LoadResetPassword value)? resetPassword,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loadVerifyToken != null) {
      return loadVerifyToken(this);
    }
    return orElse();
  }
}

abstract class _LoadVerifyToken implements ForgotPasswordState {
  const factory _LoadVerifyToken(final ApiResponse<dynamic> token) =
      _$LoadVerifyTokenImpl;

  ApiResponse<dynamic> get token;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadVerifyTokenImplCopyWith<_$LoadVerifyTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadResetPasswordImplCopyWith<$Res> {
  factory _$$LoadResetPasswordImplCopyWith(_$LoadResetPasswordImpl value,
          $Res Function(_$LoadResetPasswordImpl) then) =
      __$$LoadResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiResponse<dynamic> token});
}

/// @nodoc
class __$$LoadResetPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$LoadResetPasswordImpl>
    implements _$$LoadResetPasswordImplCopyWith<$Res> {
  __$$LoadResetPasswordImplCopyWithImpl(_$LoadResetPasswordImpl _value,
      $Res Function(_$LoadResetPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$LoadResetPasswordImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as ApiResponse<dynamic>,
    ));
  }
}

/// @nodoc

class _$LoadResetPasswordImpl
    with DiagnosticableTreeMixin
    implements _LoadResetPassword {
  const _$LoadResetPasswordImpl(this.token);

  @override
  final ApiResponse<dynamic> token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.resetPassword(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordState.resetPassword'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadResetPasswordImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadResetPasswordImplCopyWith<_$LoadResetPasswordImpl> get copyWith =>
      __$$LoadResetPasswordImplCopyWithImpl<_$LoadResetPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiResponse<dynamic> email) loadForgotPassword,
    required TResult Function(ApiResponse<dynamic> token) loadVerifyToken,
    required TResult Function(ApiResponse<dynamic> token) resetPassword,
    required TResult Function(String message) failed,
  }) {
    return resetPassword(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult? Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult? Function(ApiResponse<dynamic> token)? resetPassword,
    TResult? Function(String message)? failed,
  }) {
    return resetPassword?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult Function(ApiResponse<dynamic> token)? resetPassword,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadForgotPassword value) loadForgotPassword,
    required TResult Function(_LoadVerifyToken value) loadVerifyToken,
    required TResult Function(_LoadResetPassword value) resetPassword,
    required TResult Function(_Failed value) failed,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult? Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult? Function(_LoadResetPassword value)? resetPassword,
    TResult? Function(_Failed value)? failed,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult Function(_LoadResetPassword value)? resetPassword,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _LoadResetPassword implements ForgotPasswordState {
  const factory _LoadResetPassword(final ApiResponse<dynamic> token) =
      _$LoadResetPasswordImpl;

  ApiResponse<dynamic> get token;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadResetPasswordImplCopyWith<_$LoadResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl with DiagnosticableTreeMixin implements _Failed {
  const _$FailedImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.failed(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordState.failed'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiResponse<dynamic> email) loadForgotPassword,
    required TResult Function(ApiResponse<dynamic> token) loadVerifyToken,
    required TResult Function(ApiResponse<dynamic> token) resetPassword,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult? Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult? Function(ApiResponse<dynamic> token)? resetPassword,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiResponse<dynamic> email)? loadForgotPassword,
    TResult Function(ApiResponse<dynamic> token)? loadVerifyToken,
    TResult Function(ApiResponse<dynamic> token)? resetPassword,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadForgotPassword value) loadForgotPassword,
    required TResult Function(_LoadVerifyToken value) loadVerifyToken,
    required TResult Function(_LoadResetPassword value) resetPassword,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult? Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult? Function(_LoadResetPassword value)? resetPassword,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadForgotPassword value)? loadForgotPassword,
    TResult Function(_LoadVerifyToken value)? loadVerifyToken,
    TResult Function(_LoadResetPassword value)? resetPassword,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements ForgotPasswordState {
  const factory _Failed(final String message) = _$FailedImpl;

  String get message;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
