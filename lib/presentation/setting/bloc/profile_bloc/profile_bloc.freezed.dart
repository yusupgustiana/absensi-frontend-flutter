// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) getProfile,
    required TResult Function(EditProfileRequest edit) postEditProfile,
    required TResult Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)
        changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? getProfile,
    TResult? Function(EditProfileRequest edit)? postEditProfile,
    TResult? Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)?
        changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? getProfile,
    TResult Function(EditProfileRequest edit)? postEditProfile,
    TResult Function(String idUser, String currentPassword, String newPassword1,
            String newPassword2)?
        changePassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProfile value) getProfile,
    required TResult Function(_PostEditProfile value) postEditProfile,
    required TResult Function(_ChangePassword value) changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProfile value)? getProfile,
    TResult? Function(_PostEditProfile value)? postEditProfile,
    TResult? Function(_ChangePassword value)? changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProfile value)? getProfile,
    TResult Function(_PostEditProfile value)? postEditProfile,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
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
    extends _$ProfileEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ProfileEvent.started()';
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
    required TResult Function(String idUser) getProfile,
    required TResult Function(EditProfileRequest edit) postEditProfile,
    required TResult Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)
        changePassword,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? getProfile,
    TResult? Function(EditProfileRequest edit)? postEditProfile,
    TResult? Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)?
        changePassword,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? getProfile,
    TResult Function(EditProfileRequest edit)? postEditProfile,
    TResult Function(String idUser, String currentPassword, String newPassword1,
            String newPassword2)?
        changePassword,
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
    required TResult Function(_GetProfile value) getProfile,
    required TResult Function(_PostEditProfile value) postEditProfile,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProfile value)? getProfile,
    TResult? Function(_PostEditProfile value)? postEditProfile,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProfile value)? getProfile,
    TResult Function(_PostEditProfile value)? postEditProfile,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProfileEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetProfileImplCopyWith<$Res> {
  factory _$$GetProfileImplCopyWith(
          _$GetProfileImpl value, $Res Function(_$GetProfileImpl) then) =
      __$$GetProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String idUser});
}

/// @nodoc
class __$$GetProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetProfileImpl>
    implements _$$GetProfileImplCopyWith<$Res> {
  __$$GetProfileImplCopyWithImpl(
      _$GetProfileImpl _value, $Res Function(_$GetProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
  }) {
    return _then(_$GetProfileImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProfileImpl implements _GetProfile {
  const _$GetProfileImpl({required this.idUser});

  @override
  final String idUser;

  @override
  String toString() {
    return 'ProfileEvent.getProfile(idUser: $idUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProfileImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idUser);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProfileImplCopyWith<_$GetProfileImpl> get copyWith =>
      __$$GetProfileImplCopyWithImpl<_$GetProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) getProfile,
    required TResult Function(EditProfileRequest edit) postEditProfile,
    required TResult Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)
        changePassword,
  }) {
    return getProfile(idUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? getProfile,
    TResult? Function(EditProfileRequest edit)? postEditProfile,
    TResult? Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)?
        changePassword,
  }) {
    return getProfile?.call(idUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? getProfile,
    TResult Function(EditProfileRequest edit)? postEditProfile,
    TResult Function(String idUser, String currentPassword, String newPassword1,
            String newPassword2)?
        changePassword,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile(idUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProfile value) getProfile,
    required TResult Function(_PostEditProfile value) postEditProfile,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return getProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProfile value)? getProfile,
    TResult? Function(_PostEditProfile value)? postEditProfile,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return getProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProfile value)? getProfile,
    TResult Function(_PostEditProfile value)? postEditProfile,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile(this);
    }
    return orElse();
  }
}

abstract class _GetProfile implements ProfileEvent {
  const factory _GetProfile({required final String idUser}) = _$GetProfileImpl;

  String get idUser;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProfileImplCopyWith<_$GetProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostEditProfileImplCopyWith<$Res> {
  factory _$$PostEditProfileImplCopyWith(_$PostEditProfileImpl value,
          $Res Function(_$PostEditProfileImpl) then) =
      __$$PostEditProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EditProfileRequest edit});
}

/// @nodoc
class __$$PostEditProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$PostEditProfileImpl>
    implements _$$PostEditProfileImplCopyWith<$Res> {
  __$$PostEditProfileImplCopyWithImpl(
      _$PostEditProfileImpl _value, $Res Function(_$PostEditProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edit = null,
  }) {
    return _then(_$PostEditProfileImpl(
      null == edit
          ? _value.edit
          : edit // ignore: cast_nullable_to_non_nullable
              as EditProfileRequest,
    ));
  }
}

/// @nodoc

class _$PostEditProfileImpl implements _PostEditProfile {
  const _$PostEditProfileImpl(this.edit);

  @override
  final EditProfileRequest edit;

  @override
  String toString() {
    return 'ProfileEvent.postEditProfile(edit: $edit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostEditProfileImpl &&
            (identical(other.edit, edit) || other.edit == edit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, edit);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostEditProfileImplCopyWith<_$PostEditProfileImpl> get copyWith =>
      __$$PostEditProfileImplCopyWithImpl<_$PostEditProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) getProfile,
    required TResult Function(EditProfileRequest edit) postEditProfile,
    required TResult Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)
        changePassword,
  }) {
    return postEditProfile(edit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? getProfile,
    TResult? Function(EditProfileRequest edit)? postEditProfile,
    TResult? Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)?
        changePassword,
  }) {
    return postEditProfile?.call(edit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? getProfile,
    TResult Function(EditProfileRequest edit)? postEditProfile,
    TResult Function(String idUser, String currentPassword, String newPassword1,
            String newPassword2)?
        changePassword,
    required TResult orElse(),
  }) {
    if (postEditProfile != null) {
      return postEditProfile(edit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProfile value) getProfile,
    required TResult Function(_PostEditProfile value) postEditProfile,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return postEditProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProfile value)? getProfile,
    TResult? Function(_PostEditProfile value)? postEditProfile,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return postEditProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProfile value)? getProfile,
    TResult Function(_PostEditProfile value)? postEditProfile,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (postEditProfile != null) {
      return postEditProfile(this);
    }
    return orElse();
  }
}

abstract class _PostEditProfile implements ProfileEvent {
  const factory _PostEditProfile(final EditProfileRequest edit) =
      _$PostEditProfileImpl;

  EditProfileRequest get edit;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostEditProfileImplCopyWith<_$PostEditProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordImplCopyWith<$Res> {
  factory _$$ChangePasswordImplCopyWith(_$ChangePasswordImpl value,
          $Res Function(_$ChangePasswordImpl) then) =
      __$$ChangePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String idUser,
      String currentPassword,
      String newPassword1,
      String newPassword2});
}

/// @nodoc
class __$$ChangePasswordImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ChangePasswordImpl>
    implements _$$ChangePasswordImplCopyWith<$Res> {
  __$$ChangePasswordImplCopyWithImpl(
      _$ChangePasswordImpl _value, $Res Function(_$ChangePasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? currentPassword = null,
    Object? newPassword1 = null,
    Object? newPassword2 = null,
  }) {
    return _then(_$ChangePasswordImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword1: null == newPassword1
          ? _value.newPassword1
          : newPassword1 // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword2: null == newPassword2
          ? _value.newPassword2
          : newPassword2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordImpl implements _ChangePassword {
  const _$ChangePasswordImpl(
      {required this.idUser,
      required this.currentPassword,
      required this.newPassword1,
      required this.newPassword2});

  @override
  final String idUser;
  @override
  final String currentPassword;
  @override
  final String newPassword1;
  @override
  final String newPassword2;

  @override
  String toString() {
    return 'ProfileEvent.changePassword(idUser: $idUser, currentPassword: $currentPassword, newPassword1: $newPassword1, newPassword2: $newPassword2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword1, newPassword1) ||
                other.newPassword1 == newPassword1) &&
            (identical(other.newPassword2, newPassword2) ||
                other.newPassword2 == newPassword2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, idUser, currentPassword, newPassword1, newPassword2);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      __$$ChangePasswordImplCopyWithImpl<_$ChangePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idUser) getProfile,
    required TResult Function(EditProfileRequest edit) postEditProfile,
    required TResult Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)
        changePassword,
  }) {
    return changePassword(idUser, currentPassword, newPassword1, newPassword2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idUser)? getProfile,
    TResult? Function(EditProfileRequest edit)? postEditProfile,
    TResult? Function(String idUser, String currentPassword,
            String newPassword1, String newPassword2)?
        changePassword,
  }) {
    return changePassword?.call(
        idUser, currentPassword, newPassword1, newPassword2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idUser)? getProfile,
    TResult Function(EditProfileRequest edit)? postEditProfile,
    TResult Function(String idUser, String currentPassword, String newPassword1,
            String newPassword2)?
        changePassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(
          idUser, currentPassword, newPassword1, newPassword2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProfile value) getProfile,
    required TResult Function(_PostEditProfile value) postEditProfile,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProfile value)? getProfile,
    TResult? Function(_PostEditProfile value)? postEditProfile,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProfile value)? getProfile,
    TResult Function(_PostEditProfile value)? postEditProfile,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements ProfileEvent {
  const factory _ChangePassword(
      {required final String idUser,
      required final String currentPassword,
      required final String newPassword1,
      required final String newPassword2}) = _$ChangePasswordImpl;

  String get idUser;
  String get currentPassword;
  String get newPassword1;
  String get newPassword2;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProfileModel data) loadedProfile,
    required TResult Function(List<ProfileModel> editProfile) loadedEditProfile,
    required TResult Function(String message) passwordChanged,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileModel data)? loadedProfile,
    TResult? Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult? Function(String message)? passwordChanged,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileModel data)? loadedProfile,
    TResult Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult Function(String message)? passwordChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loadedProfile,
    required TResult Function(_LoadedEditProfile value) loadedEditProfile,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loadedProfile,
    TResult? Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loadedProfile,
    TResult Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
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
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileState.initial()';
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
    required TResult Function(ProfileModel data) loadedProfile,
    required TResult Function(List<ProfileModel> editProfile) loadedEditProfile,
    required TResult Function(String message) passwordChanged,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileModel data)? loadedProfile,
    TResult? Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult? Function(String message)? passwordChanged,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileModel data)? loadedProfile,
    TResult Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult Function(String message)? passwordChanged,
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
    required TResult Function(_Loaded value) loadedProfile,
    required TResult Function(_LoadedEditProfile value) loadedEditProfile,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loadedProfile,
    TResult? Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loadedProfile,
    TResult Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProfileState.loading()';
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
    required TResult Function(ProfileModel data) loadedProfile,
    required TResult Function(List<ProfileModel> editProfile) loadedEditProfile,
    required TResult Function(String message) passwordChanged,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileModel data)? loadedProfile,
    TResult? Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult? Function(String message)? passwordChanged,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileModel data)? loadedProfile,
    TResult Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult Function(String message)? passwordChanged,
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
    required TResult Function(_Loaded value) loadedProfile,
    required TResult Function(_LoadedEditProfile value) loadedEditProfile,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loadedProfile,
    TResult? Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loadedProfile,
    TResult Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProfileState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileModel data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final ProfileModel data;

  @override
  String toString() {
    return 'ProfileState.loadedProfile(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of ProfileState
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
    required TResult Function(ProfileModel data) loadedProfile,
    required TResult Function(List<ProfileModel> editProfile) loadedEditProfile,
    required TResult Function(String message) passwordChanged,
    required TResult Function(String message) error,
  }) {
    return loadedProfile(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileModel data)? loadedProfile,
    TResult? Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult? Function(String message)? passwordChanged,
    TResult? Function(String message)? error,
  }) {
    return loadedProfile?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileModel data)? loadedProfile,
    TResult Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult Function(String message)? passwordChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedProfile != null) {
      return loadedProfile(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loadedProfile,
    required TResult Function(_LoadedEditProfile value) loadedEditProfile,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Error value) error,
  }) {
    return loadedProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loadedProfile,
    TResult? Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Error value)? error,
  }) {
    return loadedProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loadedProfile,
    TResult Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedProfile != null) {
      return loadedProfile(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ProfileState {
  const factory _Loaded(final ProfileModel data) = _$LoadedImpl;

  ProfileModel get data;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedEditProfileImplCopyWith<$Res> {
  factory _$$LoadedEditProfileImplCopyWith(_$LoadedEditProfileImpl value,
          $Res Function(_$LoadedEditProfileImpl) then) =
      __$$LoadedEditProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProfileModel> editProfile});
}

/// @nodoc
class __$$LoadedEditProfileImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadedEditProfileImpl>
    implements _$$LoadedEditProfileImplCopyWith<$Res> {
  __$$LoadedEditProfileImplCopyWithImpl(_$LoadedEditProfileImpl _value,
      $Res Function(_$LoadedEditProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editProfile = null,
  }) {
    return _then(_$LoadedEditProfileImpl(
      null == editProfile
          ? _value._editProfile
          : editProfile // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
    ));
  }
}

/// @nodoc

class _$LoadedEditProfileImpl implements _LoadedEditProfile {
  const _$LoadedEditProfileImpl(final List<ProfileModel> editProfile)
      : _editProfile = editProfile;

  final List<ProfileModel> _editProfile;
  @override
  List<ProfileModel> get editProfile {
    if (_editProfile is EqualUnmodifiableListView) return _editProfile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editProfile);
  }

  @override
  String toString() {
    return 'ProfileState.loadedEditProfile(editProfile: $editProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedEditProfileImpl &&
            const DeepCollectionEquality()
                .equals(other._editProfile, _editProfile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_editProfile));

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedEditProfileImplCopyWith<_$LoadedEditProfileImpl> get copyWith =>
      __$$LoadedEditProfileImplCopyWithImpl<_$LoadedEditProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProfileModel data) loadedProfile,
    required TResult Function(List<ProfileModel> editProfile) loadedEditProfile,
    required TResult Function(String message) passwordChanged,
    required TResult Function(String message) error,
  }) {
    return loadedEditProfile(editProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileModel data)? loadedProfile,
    TResult? Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult? Function(String message)? passwordChanged,
    TResult? Function(String message)? error,
  }) {
    return loadedEditProfile?.call(editProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileModel data)? loadedProfile,
    TResult Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult Function(String message)? passwordChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedEditProfile != null) {
      return loadedEditProfile(editProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loadedProfile,
    required TResult Function(_LoadedEditProfile value) loadedEditProfile,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Error value) error,
  }) {
    return loadedEditProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loadedProfile,
    TResult? Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Error value)? error,
  }) {
    return loadedEditProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loadedProfile,
    TResult Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedEditProfile != null) {
      return loadedEditProfile(this);
    }
    return orElse();
  }
}

abstract class _LoadedEditProfile implements ProfileState {
  const factory _LoadedEditProfile(final List<ProfileModel> editProfile) =
      _$LoadedEditProfileImpl;

  List<ProfileModel> get editProfile;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedEditProfileImplCopyWith<_$LoadedEditProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedImplCopyWith<$Res> {
  factory _$$PasswordChangedImplCopyWith(_$PasswordChangedImpl value,
          $Res Function(_$PasswordChangedImpl) then) =
      __$$PasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PasswordChangedImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$PasswordChangedImpl>
    implements _$$PasswordChangedImplCopyWith<$Res> {
  __$$PasswordChangedImplCopyWithImpl(
      _$PasswordChangedImpl _value, $Res Function(_$PasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PasswordChangedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChangedImpl implements _PasswordChanged {
  const _$PasswordChangedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState.passwordChanged(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      __$$PasswordChangedImplCopyWithImpl<_$PasswordChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProfileModel data) loadedProfile,
    required TResult Function(List<ProfileModel> editProfile) loadedEditProfile,
    required TResult Function(String message) passwordChanged,
    required TResult Function(String message) error,
  }) {
    return passwordChanged(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileModel data)? loadedProfile,
    TResult? Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult? Function(String message)? passwordChanged,
    TResult? Function(String message)? error,
  }) {
    return passwordChanged?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileModel data)? loadedProfile,
    TResult Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult Function(String message)? passwordChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loadedProfile,
    required TResult Function(_LoadedEditProfile value) loadedEditProfile,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Error value) error,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loadedProfile,
    TResult? Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Error value)? error,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loadedProfile,
    TResult Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements ProfileState {
  const factory _PasswordChanged(final String message) = _$PasswordChangedImpl;

  String get message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
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
    extends _$ProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
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
    return 'ProfileState.error(message: $message)';
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

  /// Create a copy of ProfileState
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
    required TResult Function(ProfileModel data) loadedProfile,
    required TResult Function(List<ProfileModel> editProfile) loadedEditProfile,
    required TResult Function(String message) passwordChanged,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileModel data)? loadedProfile,
    TResult? Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult? Function(String message)? passwordChanged,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileModel data)? loadedProfile,
    TResult Function(List<ProfileModel> editProfile)? loadedEditProfile,
    TResult Function(String message)? passwordChanged,
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
    required TResult Function(_Loaded value) loadedProfile,
    required TResult Function(_LoadedEditProfile value) loadedEditProfile,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loadedProfile,
    TResult? Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loadedProfile,
    TResult Function(_LoadedEditProfile value)? loadedEditProfile,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProfileState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
