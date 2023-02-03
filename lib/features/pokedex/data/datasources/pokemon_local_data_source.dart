import 'dart:convert';

import 'package:flutterdex/features/pokedex/data/models/custom_pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonLocalDataSource {
  const PokemonLocalDataSource();

  Future<void> addCustomPokemon(CustomPokemonModel pokemon) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(pokemon.id, json.encode(pokemon.toJson()));
  }

  Future<void> removeCustomPokemon({required String id}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(id);
  }

  Future<List<CustomPokemonModel>> listCustomPokemon() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final List<CustomPokemonModel> pokemonList = [];

    for (final key in keys) {
      final pokemon = CustomPokemonModel.fromJson(
        json.decode(prefs.getString(key)!),
      );
      pokemonList.add(pokemon);
    }
    return pokemonList;
  }
}
