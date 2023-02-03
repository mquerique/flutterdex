import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';

class CustomPokemonModel extends CustomPokemon {
  const CustomPokemonModel({
    required super.id,
    super.imagePath,
    required super.name,
    required super.pokeTypes,
    required super.abilities,
  });

  factory CustomPokemonModel.fromEntity(CustomPokemon customPokemon) {
    return CustomPokemonModel(
      id: customPokemon.id,
      imagePath: customPokemon.imagePath,
      name: customPokemon.name,
      pokeTypes: customPokemon.pokeTypes,
      abilities: customPokemon.abilities,
    );
  }

  factory CustomPokemonModel.fromJson(Map<String, dynamic> json) {
    final List<String> typesString = json['pokeTypes'].toList().cast<String>();

    return CustomPokemonModel(
      id: json['id'],
      imagePath: json['imagePath'],
      name: json['name'],
      pokeTypes: typesString.map((it) => PokeType.values.byName(it)).toList(),
      abilities: json['abilities'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'pokeTypes': pokeTypes.map((it) => it.name).toList(),
      'abilities': abilities,
    };
  }
}
