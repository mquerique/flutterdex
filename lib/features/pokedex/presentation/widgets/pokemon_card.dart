import 'package:flutter/material.dart';
import 'package:flutterdex/core/util/string_extension.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/screens/pokemon_details_screen.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_image.dart';

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
      trailing: Text(pokemon.pokeType.map((it) => it.toUpperCase()).join(' ')),
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
