part of 'kasbon_bloc.dart';

@freezed
class KasbonState with _$KasbonState {
  const factory KasbonState.initial() = _Initial;
  const factory KasbonState.loading() = _Loading;
  const factory KasbonState.loaded(List<DetailHistoryKasbon> detail) = _Loaded;
  const factory KasbonState.loadhistoryadmin(List<DetailHistoryKasbon> detail) =
      _LoadedHistoryAdmin;

  const factory KasbonState.error(String message) = _Error;
}
