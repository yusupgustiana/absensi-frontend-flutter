part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;
    const factory ProfileEvent.getProfile({
    required String idUser,
  }) = _GetProfile;
    const factory ProfileEvent.postEditProfile(
EditProfileRequest edit
 ) = _PostEditProfile;
 const factory ProfileEvent.changePassword({
  required String idUser,
  required String currentPassword,
  required String newPassword1,
  required String newPassword2,
}) = _ChangePassword;

}