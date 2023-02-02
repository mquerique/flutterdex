import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class GetPokedexUsecase {
  final PokedexRepository repository;

  const GetPokedexUsecase(this.repository);

  /*
  Latest pokemon available through pokeapi, we could fetch this value
  from the api itself or using a remote config, but for now a static
  value will work
  */
  static const _pokedexLimit = 1008;

  Future<List<Pokemon>> call({
    int offset = 0,
    required int limit,
  }) async {
    final List<Future<Pokemon>> pokemonFutureList = [];
    for (int i = 1 + offset; i <= limit + offset; i++) {
      if (i > _pokedexLimit) break;
      pokemonFutureList.add(repository.getPokemon(i));
    }
    return Future.wait(pokemonFutureList);
  }
}
