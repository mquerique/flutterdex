import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

abstract class PokedexRepository {
  Future<Pokemon> getPokemon(int pokemonId);

  Future<List<CustomPokemon>> listCustomPokemon();

  Future<void> addCustomPokemon(CustomPokemon pokemon);
}
