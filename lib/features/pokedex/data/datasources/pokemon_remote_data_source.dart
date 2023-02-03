import 'dart:convert';

import 'package:flutterdex/core/exceptions/exceptions.dart';
import 'package:flutterdex/features/pokedex/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonRemoteDataSource {
  final http.Client client;

  const PokemonRemoteDataSource({
    required this.client,
  });

  Future<PokemonModel> getPokemon(int pokemonId) async {
    final url = 'https://pokeapi.co/api/v2/pokemon/$pokemonId/';

    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
