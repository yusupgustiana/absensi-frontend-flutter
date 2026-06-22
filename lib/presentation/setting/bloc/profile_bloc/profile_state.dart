part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loadedProfile(ProfileModel data) = _Loaded;
  const factory ProfileState.loadedEditProfile(List<ProfileModel> editProfile) =
      _LoadedEditProfile;
  const factory ProfileState.passwordChanged(String message) = _PasswordChanged;

  const factory ProfileState.error(String message) = _Error;
}
