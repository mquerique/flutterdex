import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.name,
    required super.pokeType,
    required super.abilities,
    super.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      pokeType: (json['types'] as List<Map<String, dynamic>>)
          .map(
            (it) => it['name'] as String,
          )
          .toList(),
      abilities: (json['abilities'] as List<Map<String, dynamic>>)
          .map(
            (it) => it['ability']['name'] as String,
          )
          .toList(),
      imageUrl: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pokeType': pokeType,
      'abilities': abilities,
      'imageUrl': imageUrl,
    };
  }
}
