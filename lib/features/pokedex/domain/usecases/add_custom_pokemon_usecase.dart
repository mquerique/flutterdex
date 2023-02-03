import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class AddCustomPokemonUsecase {
  final PokedexRepository repository;

  const AddCustomPokemonUsecase(this.repository);

  Future<void> call({
    required String name,
    required List<PokeType> pokeTypes,
    required List<String> abilities,
    String? imagePath,
  }) async {
    return repository.addCustomPokemon(
      CustomPokemon(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        pokeTypes: pokeTypes,
        abilities: abilities,
        imagePath: imagePath,
      ),
    );
  }
}
