import 'package:flutterdex/features/pokedex/data/datasources/pokemon_local_data_source.dart';
import 'package:flutterdex/features/pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:flutterdex/features/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:flutterdex/features/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:flutterdex/features/pokedex/domain/usecases/add_custom_pokemon_usecase.dart';
import 'package:flutterdex/features/pokedex/domain/usecases/get_custom_pokedex_usecase.dart';
import 'package:flutterdex/features/pokedex/domain/usecases/get_pokedex_usecase.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/pokedex_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> setup() async {
  // Blocs
  getIt.registerFactory(
    () => PokedexBloc(
      getPokedex: getIt(),
      getCustomPokedex: getIt(),
      addPokemon: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPokedexUsecase(getIt()));
  getIt.registerLazySingleton(() => GetCustomPokedexUsecase(getIt()));
  getIt.registerLazySingleton(() => AddCustomPokemonUsecase(getIt()));

  // Repositories
  getIt.registerLazySingleton<PokedexRepository>(
    () => PokedexRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSource(
      client: getIt(),
    ),
  );
  getIt.registerLazySingleton<PokemonLocalDataSource>(
    () => const PokemonLocalDataSource(),
  );

  getIt.registerLazySingleton(() => http.Client());
}
