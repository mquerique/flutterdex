import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

class PokemonImage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonImage({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pokemon is CustomPokemon) {
      return _buildImageForCustomPokemon();
    }
    if (pokemon.imageUrl == null) {
      return _buildNoImage();
    }
    return Image.network(pokemon.imageUrl!);
  }

  Widget _buildImageForCustomPokemon() {
    final customPokemon = pokemon as CustomPokemon;
    if (customPokemon.imagePath == null) {
      return _buildNoImage();
    }
    final file = File(customPokemon.imagePath!);
    return Image.file(file);
  }

  Widget _buildNoImage() {
    return Image.asset(
      'assets/images/unown_question.png',
    );
  }
}
