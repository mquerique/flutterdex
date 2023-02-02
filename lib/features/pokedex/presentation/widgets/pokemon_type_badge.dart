import 'package:flutter/material.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';

class PokemonTypeBadge extends StatelessWidget {
  final PokeType pokeType;

  const PokemonTypeBadge({
    required this.pokeType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      width: 80,
      color: pokeType.color,
      child: Text(
        pokeType.name.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
