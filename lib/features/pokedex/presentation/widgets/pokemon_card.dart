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
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => PokemonDetailsScreen(pokemon: pokemon),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: pokemon.pokeTypes[0].color.withOpacity(0.8),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
          ),
          child: Text(
            pokemon.name.capitalize(),
            maxLines: 1,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 4),
            Column(
              children: [
                ...pokemon.pokeTypes
                    .map((it) => PokemonTypeBadge(pokeType: it))
                    .toList(),
                const SizedBox(height: 4),
              ],
            ),
            _buildImage(),
          ],
        )
      ],
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: 90,
      width: 90,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white38,
          shape: BoxShape.circle,
        ),
        child: PokemonImage(
          pokemon: pokemon,
        ),
      ),
    );
  }
}
