part of 'pokedex_bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object?> get props => [];
}

class GetPokedexEvent extends PokedexEvent {
  final int offset;
  final int limit;

  const GetPokedexEvent({
    this.offset = 0,
    required this.limit,
  });

  @override
  List<Object?> get props => [offset, limit];
}

class GetCustomPokedexEvent extends PokedexEvent {
  const GetCustomPokedexEvent();
}

class AddCustomPokemonEvent extends PokedexEvent {
  final String name;
  final List<PokeType> pokeTypes;
  final List<String> abilities;
  final String? imagePath;

  const AddCustomPokemonEvent({
    required this.name,
    required this.pokeTypes,
    required this.abilities,
    this.imagePath,
  });

  @override
  List<Object?> get props => [name, pokeTypes, abilities, imagePath];
}

class RemoveCustomPokemonEvent extends PokedexEvent {
  final String id;

  const RemoveCustomPokemonEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
