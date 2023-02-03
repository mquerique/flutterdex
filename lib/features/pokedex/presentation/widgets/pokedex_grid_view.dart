import 'package:flutter/material.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_card.dart';

class PokedexGridView extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final ScrollController? scrollController;

  const PokedexGridView({
    required this.pokemonList,
    this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingSize = 8.0;
    return GridView.builder(
      padding: const EdgeInsets.all(paddingSize),
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: paddingSize,
        mainAxisSpacing: paddingSize,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (ctx, index) {
        return PokemonCard(pokemon: pokemonList.elementAt(index));
      },
      itemCount: pokemonList.length,
    );
  }
}
