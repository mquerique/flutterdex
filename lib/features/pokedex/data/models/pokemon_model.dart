import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.name,
    required super.pokeTypes,
    required super.abilities,
    super.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final List<String> typesString =
        json['types'].map((it) => it['type']['name']).toList().cast<String>();
    return PokemonModel(
      name: json['name'],
      pokeTypes: typesString.map((it) => PokeType.values.byName(it)).toList(),
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
      'pokeType': pokeTypes,
      'abilities': abilities,
      'imageUrl': imageUrl,
    };
  }
}
