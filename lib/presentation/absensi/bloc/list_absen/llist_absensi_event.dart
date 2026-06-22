part of 'llist_absensi_bloc.dart';

@freezed
class LlistAbsensiEvent with _$LlistAbsensiEvent {
  const factory LlistAbsensiEvent.started() = _Started;
  const factory LlistAbsensiEvent.historyAbsensi({
    required String idUser,
    required String tanggalDari,
    required String tanggalSampai,
  }) = _GetHistoryAbsensi;
  // const factory LlistAbsensiEvent.allHistoryAbsensi({
  //   required String idUser,
  //   required String tanggalDari,
  //   required String tanggalSampai,
  // }) = _GetAllHistoryAbsensi;
  const factory LlistAbsensiEvent.approveCheckin({
    required String idAbsensi,
  }) = _ApproveCheckin;

  const factory LlistAbsensiEvent.approveCheckout({
    required String idAbsensi,
  }) = _ApproveCheckout;
  const factory LlistAbsensiEvent.approveAll(
      {required String idUser, required List<String> ids}) = _ApproveAll;
}
