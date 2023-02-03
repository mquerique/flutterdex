import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

class CustomPokemon extends Pokemon {
  final String id;
  final String? imagePath;

  const CustomPokemon({
    required this.id,
    this.imagePath,
    required super.name,
    required super.pokeTypes,
    required super.abilities,
  });
}
