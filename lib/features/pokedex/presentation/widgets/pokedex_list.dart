import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/pokedex_bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_card.dart';
import 'package:flutterdex/injection_container.dart';

class PokedexListview extends StatefulWidget {
  const PokedexListview({
    Key? key,
  }) : super(key: key);

  @override
  State<PokedexListview> createState() => _PokedexListviewState();
}

class _PokedexListviewState extends State<PokedexListview> {
  final Set<Pokemon> _loadedPokemon = {};
  static const _fetchLimit = 15;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokedexBloc>(
      create: (_) => getIt<PokedexBloc>()
        ..add(
          const GetPokedexEvent(limit: _fetchLimit),
        ),
      child: Center(
        child: BlocBuilder<PokedexBloc, PokedexState>(
          builder: _buildPokedex,
        ),
      ),
    );
  }

  Widget _buildPokedex(BuildContext context, PokedexState state) {
    if (state is PokedexEmptyState) {
      return Text('Empty');
    }
    if (state is PokedexLoadingState) {
      return const CircularProgressIndicator();
    }
    if (state is PokedexLoadedState) {
      _loadedPokemon.addAll(state.pokedex);
      return _buildListView();
    }
    return Text('Something went wrong');
  }

  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        if (index == 0) {
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<PokedexBloc>(ctx).add(
                GetPokedexEvent(
                  limit: _fetchLimit,
                  offset: _loadedPokemon.length,
                ),
              );
            },
            child: Text('Test'),
          );
        }
        return PokemonCard(pokemon: _loadedPokemon.elementAt(index - 1));
      },
      itemCount: _loadedPokemon.length + 1,
    );
  }
}
