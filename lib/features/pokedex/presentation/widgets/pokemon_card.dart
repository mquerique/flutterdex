import 'package:flutter/material.dart';
import 'package:flutterdex/core/util/string_extension.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(pokemon.imageUrl!),
      title: Text(pokemon.name.capitalize()),
      trailing: Text(pokemon.pokeType.map((it) => it.toUpperCase()).join(' ')),
      onTap: () {},
    );
  }
}
