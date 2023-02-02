import 'package:flutter/material.dart';
import 'package:flutterdex/core/util/string_extension.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_image.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_type_badge.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.capitalize()),
      ),
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Text(pokemon.name),
        PokemonImage(pokemon: pokemon),
        Row(
          children: pokemon.pokeTypes
              .map(
                (it) => PokemonTypeBadge(pokeType: it),
              )
              .toList(),
        ),
        Row(
          children: pokemon.abilities.map((it) => Text(it)).toList(),
        ),
      ],
    );
  }
}
