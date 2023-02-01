import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class GetPokemon {
  final PokedexRepository repository;

  const GetPokemon(this.repository);

  Future<Pokemon> call({required int pokemonId}) async {
    return await repository.getPokemon(pokemonId);
  }
}
