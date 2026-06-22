import 'package:absensi/presentation/absensi/models/list_absensi.dart';
import 'package:absensi/presentation/absensi/services/absensi_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'llist_absensi_event.dart';
part 'llist_absensi_state.dart';
part 'llist_absensi_bloc.freezed.dart';

class LlistAbsensiBloc extends Bloc<LlistAbsensiEvent, LlistAbsensiState> {
  final AbsensiService service;

  LlistAbsensiBloc(this.service) : super(const _Initial()) {
    on<_GetHistoryAbsensi>((event, emit) async {
      emit(const LlistAbsensiState.loading());
      try {
        final result = await service.historyAbsensi(
          idUser: event.idUser,
          tanggalDari: event.tanggalDari,
          tanggalSampai: event.tanggalSampai,
        );
        emit(LlistAbsensiState.loaded(result));
      } catch (e) {
        emit(LlistAbsensiState.error(e.toString()));
      }
    });

    on<_ApproveAll>((event, emit) async {
      emit(const LlistAbsensiState.loading());

      try {
        await service.approveAbsensi(event.idUser, event.ids);

        emit(const LlistAbsensiState.success());
      } catch (e) {
        emit(LlistAbsensiState.error(e.toString()));
      }
    });

    //     on<_GetAllHistoryAbsensi>((event, emit) async {
    //   emit(const LlistAbsensiState.loading());
    //   try {
    //     final result = await service.allHistoryAbsensi(
    //       idUser: event.idUser,
    //       tanggalDari: event.tanggalDari,
    //       tanggalSampai: event.tanggalSampai,
    //     );
    //     emit(LlistAbsensiState.loadedAllHistory(result));
    //   } catch (e) {
    //     emit(LlistAbsensiState.error(e.toString()));
    //   }
    // });
  }
}
