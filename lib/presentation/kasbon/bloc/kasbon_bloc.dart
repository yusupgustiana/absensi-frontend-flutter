import 'package:absensi/presentation/kasbon/models/all_history_kasbon_models.dart';
import 'package:absensi/presentation/kasbon/services/kasbon_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kasbon_event.dart';
part 'kasbon_state.dart';
part 'kasbon_bloc.freezed.dart';

class KasbonBloc extends Bloc<KasbonEvent, KasbonState> {
  final KasbonService _kasbonService;

  KasbonBloc(this._kasbonService) : super(const _Initial()) {
    on<_GetHistoryKasbon>((event, emit) async {
      emit(const KasbonState.loading());
      final result = await _kasbonService.getHistoryKasbon(event.idUser);
      result.fold(
        (e) => emit(KasbonState.error(e)),
        (list) => emit(KasbonState.loaded(list)),
      );
    });
    on<_GetHistoryKasbonAdmin>((event, emit) async {
      emit(const KasbonState.loading());
      final result = await _kasbonService.getSemuaKasbon();
      result.fold(
        (e) => emit(KasbonState.error(e)),
        (list) => emit(KasbonState.loadhistoryadmin(list)),
      );
    });
  }
}
