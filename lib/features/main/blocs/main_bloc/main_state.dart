part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.state({
    @Default([]) List<String> currencies,
  }) = _State;
}
