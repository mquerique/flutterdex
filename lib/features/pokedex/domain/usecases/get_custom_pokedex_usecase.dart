import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class GetCustomPokedexUsecase {
  final PokedexRepository repository;

  const GetCustomPokedexUsecase(this.repository);

  Future<List<CustomPokemon>> call() async {
    return repository.listCustomPokemon();
  }
}
