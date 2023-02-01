import 'package:flutterdex/features/pokedex/data/datasources/pokemon_remote_datasource.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokemonRemoteDataSource remoteDataSource;

  const PokedexRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Pokemon> getPokemon(int pokemonId) {
    return remoteDataSource.getPokemon(pokemonId);
  }
}
