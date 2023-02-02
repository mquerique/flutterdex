import 'package:flutter/material.dart';
import 'package:flutterdex/core/util/string_extension.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/screens/pokemon_details_screen.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_image.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_type_badge.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PokemonImage(pokemon: pokemon),
      title: Text(pokemon.name.capitalize()),
      trailing: Column(
        children: pokemon.pokeTypes
            .map(
              (it) => PokemonTypeBadge(pokeType: it),
            )
            .toList(),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => PokemonDetailsScreen(pokemon: pokemon),
          ),
        );
      },
    );
  }
}
