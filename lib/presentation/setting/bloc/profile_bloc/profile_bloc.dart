import 'package:absensi/models/request/edit_profile_request.dart';
import 'package:absensi/models/response/profile.dart';
import 'package:absensi/presentation/login/services/auth_service.dart';
import 'package:absensi/presentation/setting/services/profile_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileServices _profileServices;
    final AuthService _authService;

  ProfileBloc(this._profileServices,this._authService) : super(const ProfileState.initial()) {
    // 🔄 Get Profile
    on<_GetProfile>((event, emit) async {
      emit(const ProfileState.loading());
      final result = await _profileServices.getProfile(event.idUser);
      result.fold(
        (error) => emit(ProfileState.error(error)),
        (profile) => emit(ProfileState.loadedProfile(profile)),
      );
    });

    // 📝 Post Edit Profile
    on<_PostEditProfile>((event, emit) async {
      emit(const ProfileState.loading());
      final result = await _profileServices.editProfile(event.edit);
      result.fold(
        (error) => emit(ProfileState.error(error)),
        (res) => emit(ProfileState.loadedEditProfile([res])),
      );
    });
    
    on<_ChangePassword>((event, emit) async {
      emit(const ProfileState.loading());
      final result = await _authService.changePassword(
        idUser: event.idUser,
        currentPassword: event.currentPassword,
        newPassword1: event.newPassword1,
        newPassword2: event.newPassword2,
      );

      result.fold(
        (err) => emit(ProfileState.error(err)),
        (msg) => emit(ProfileState.passwordChanged(msg)),
      );
    });
  }
}
