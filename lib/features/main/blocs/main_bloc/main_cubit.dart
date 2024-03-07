import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.getCurrenciesUseCase,
  }) : super(const MainState.state());

  final GetCurrenciesUseCase getCurrenciesUseCase;

  Future<void> getCurrenciesList() async {
    final result = await getCurrenciesUseCase.call(NoParams());
    result.fold(
      (failure) => null,
      (success) {
        emit(state.copyWith(currencies: success.keys.toList()));
      },
    );
  }
}
