import 'package:flutterdex/features/pokedex/data/datasources/pokemon_local_data_source.dart';
import 'package:flutterdex/features/pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:flutterdex/features/pokedex/data/models/custom_pokemon_model.dart';
import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  const PokedexRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Pokemon> getPokemon(int pokemonId) {
    return remoteDataSource.getPokemon(pokemonId);
  }

  @override
  Future<void> addCustomPokemon(CustomPokemon pokemon) {
    return localDataSource.addCustomPokemon(
      CustomPokemonModel.fromEntity(pokemon),
    );
  }

  @override
  Future<List<CustomPokemon>> listCustomPokemon() {
    return localDataSource.listCustomPokemon();
  }
}
