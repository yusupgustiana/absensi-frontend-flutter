part of 'kasbon_bloc.dart';

@freezed
class KasbonEvent with _$KasbonEvent {
  const factory KasbonEvent.started() = _Started;
  const factory KasbonEvent.historyKasbon({required String idUser}) =
      _GetHistoryKasbon;

  const factory KasbonEvent.historyKasbonAdmin() = _GetHistoryKasbonAdmin;
}
