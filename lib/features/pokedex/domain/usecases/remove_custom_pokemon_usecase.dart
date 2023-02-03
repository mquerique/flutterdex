import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class RemoveCustomPokemonUsecase {
  final PokedexRepository repository;

  const RemoveCustomPokemonUsecase(this.repository);

  Future<void> call({
    required String id,
  }) async {
    return repository.removeCustomPokemon(id: id);
  }
}
