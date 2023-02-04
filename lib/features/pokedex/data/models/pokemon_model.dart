import 'package:flutterdex/features/pokedex/data/models/poke_status_model.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.name,
    required super.pokeTypes,
    required super.abilities,
    super.imageUrl,
    super.stats,
    super.height,
    super.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final List<String> typesString =
        json['types'].map((it) => it['type']['name']).toList().cast<String>();
    final List<Map<String, dynamic>> statsArray =
        json['stats'].toList().cast<Map<String, dynamic>>();

    return PokemonModel(
      name: json['name'],
      pokeTypes: typesString.map((it) => PokeType.values.byName(it)).toList(),
      abilities: json['abilities']
          .map((it) => it['ability']['name'])
          .toList()
          .cast<String>(),
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      stats: PokeStatusModel.fromJsonArray(statsArray),
      height: json['height'] / 10,
      weight: json['weight'] / 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pokeType': pokeTypes,
      'abilities': abilities,
      'imageUrl': imageUrl,
      'status': stats,
      'height': height,
      'weight': weight,
    };
  }
}
