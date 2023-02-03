import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/pokedex_bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokedex_grid_view.dart';
import 'package:flutterdex/injection_container.dart';

class PokedexList extends StatefulWidget {
  const PokedexList({
    Key? key,
  }) : super(key: key);

  @override
  State<PokedexList> createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  static const _fetchLimit = 50;

  final Set<Pokemon> _loadedPokemon = {};
  late ScrollController scrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
    if (state is PokedexEmptyState || state is PokedexLoadingState) {
      return const CircularProgressIndicator();
    }
    if (state is PokedexLoadedState) {
      scrollController = ScrollController()
        ..addListener(() {
          _handleScroll(context);
        });
      _loadedPokemon.addAll(state.pokedex);
      return PokedexGridView(
        pokemonList: _loadedPokemon.toList(),
        scrollController: scrollController,
      );
    }
    return Text(AppLocalization.of(context).tr('something_went_wrong'));
  }

  void _handleScroll(BuildContext context) {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      BlocProvider.of<PokedexBloc>(context).add(
        GetPokedexEvent(
          limit: _fetchLimit,
          offset: _loadedPokemon.length,
        ),
      );
    }
  }
}
