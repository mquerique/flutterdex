import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class GetPokedexUsecase {
  final PokedexRepository repository;

  const GetPokedexUsecase(this.repository);

  Future<List<Pokemon>> call({
    int offset = 0,
    required int limit,
  }) async {
    final List<Future<Pokemon>> pokemonFutureList = [];
    for (int i = 1 + offset; i <= limit + offset; i++) {
      pokemonFutureList.add(repository.getPokemon(i));
    }
    return Future.wait(pokemonFutureList);
  }
}
