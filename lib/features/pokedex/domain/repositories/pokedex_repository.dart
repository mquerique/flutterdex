import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

abstract class PokedexRepository {
  Future<Pokemon> getPokemon(int pokemonId);
}
