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
      pokeType:
          json['types'].map((it) => it['type']['name']).toList().cast<String>(),
      abilities: json['abilities']
          .map((it) => it['ability']['name'])
          .toList()
          .cast<String>(),
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
