part of 'llist_absensi_bloc.dart';

@freezed
class LlistAbsensiState with _$LlistAbsensiState {
  const factory LlistAbsensiState.initial() = _Initial;
  const factory LlistAbsensiState.loading() = _Loading;
  const factory LlistAbsensiState.loaded(List<DetailHistoryAbsensi> data) =
      _Loaded;
        const factory LlistAbsensiState.loadedAllHistory(List<DetailHistoryAbsensi> data) =
      _LoadedAllHistory;
  const factory LlistAbsensiState.loadedListLupaAbsensi(
          List<DetailHistoryAbsensi> dataLupaAbsen,
          [Map<String, List<DetailHistoryAbsensi>>? groupedData]) =
      _LoadedListLupaAbsensi;
  const factory LlistAbsensiState.loadedListApproved(
          List<DetailHistoryAbsensi> dataLupaAbsensi,
          [Map<String, List<DetailHistoryAbsensi>>? groupedData]) =
      _LoadedListApproved;
  // const factory LlistAbsensiState.loadedAbsensiDuaMingguTerakhir(
  //     List<DetailHistoryAbsensi> data,
  //     {int? approvedCount}) = _LoadedAbsensiDUaMingguTerakhir;
  const factory LlistAbsensiState.error(String message) = _Error;
  const factory LlistAbsensiState.success() = _Success;

}
