import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterdex/core/util/logger.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/usecases/get_pokedex_usecase.dart';

part 'pokedex_event.dart';

part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final GetPokedexUsecase getPokedex;

  PokedexBloc({
    required this.getPokedex,
  }) : super(PokedexEmptyState()) {
    on<GetPokedexEvent>((event, emit) async {
      try {
        final result = await getPokedex(
          offset: event.offset,
          limit: event.limit,
        );
        emit(PokedexLoadedState(pokedex: result));
      } catch (e) {
        Logger.log(e);
        emit(PokedexErrorState());
      }
    });
  }
}
