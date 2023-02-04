part of 'pokedex_bloc.dart';

abstract class PokedexState extends Equatable {
  const PokedexState();

  @override
  List<Object> get props => [];
}

class PokedexInitialState extends PokedexState {}

class PokedexLoadingState extends PokedexState {}

class PokedexLoadedState extends PokedexState {
  final List<Pokemon> pokedex;

  const PokedexLoadedState({
    required this.pokedex,
  });

  @override
  List<Object> get props => [pokedex];
}

class CustomPokedexLoadedState extends PokedexState {
  final List<CustomPokemon> pokedex;

  const CustomPokedexLoadedState({
    required this.pokedex,
  });

  @override
  List<Object> get props => [pokedex];
}

class CustomPokemonAddedState extends PokedexState {}

class CustomPokemonRemovedState extends PokedexState {}

class PokedexErrorState extends PokedexState {}
