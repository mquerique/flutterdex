import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokedex_grid_view.dart';
import 'package:flutterdex/injection_container.dart';

class CustomPokedexList extends StatefulWidget {
  const CustomPokedexList({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomPokedexList> createState() => _CustomPokedexListState();
}

class _CustomPokedexListState extends State<CustomPokedexList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokedexBloc>(
      create: (_) => getIt<PokedexBloc>()
        ..add(
          const GetCustomPokedexEvent(),
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
    if (state is CustomPokedexLoadedState) {
      return PokedexGridView(pokemonList: state.pokedex);
    }
    return Text(AppLocalization.of(context).tr('something_went_wrong'));
  }
}
