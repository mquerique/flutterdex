import 'package:flutter/material.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

class PokemonImage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonImage({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pokemon.imageUrl == null) {
      return Image.asset(
        'assets/images/unown_question.png',
      );
    }
    return Image.network(pokemon.imageUrl!);
  }
}
