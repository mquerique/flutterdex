import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterdex/core/util/logger.dart';
import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/usecases/add_custom_pokemon_usecase.dart';
import 'package:flutterdex/features/pokedex/domain/usecases/get_custom_pokedex_usecase.dart';
import 'package:flutterdex/features/pokedex/domain/usecases/get_pokedex_usecase.dart';

part 'pokedex_event.dart';

part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final GetPokedexUsecase getPokedex;
  final GetCustomPokedexUsecase getCustomPokedex;
  final AddCustomPokemonUsecase addPokemon;

  PokedexBloc({
    required this.getPokedex,
    required this.getCustomPokedex,
    required this.addPokemon,
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

    on<GetCustomPokedexEvent>((event, emit) async {
      emit(PokedexLoadingState());
      try {
        final result = await getCustomPokedex();
        emit(CustomPokedexLoadedState(pokedex: result));
      } catch (e) {
        Logger.log(e);
        emit(PokedexErrorState());
      }
    });

    on<AddCustomPokemonEvent>((event, emit) async {
      await addPokemon(
        name: event.name,
        pokeTypes: event.pokeTypes,
        abilities: event.abilities,
      );
    });
  }
}
