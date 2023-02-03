import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokedex_grid_view.dart';

class CustomPokedexList extends StatefulWidget {
  const CustomPokedexList({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomPokedexList> createState() => _CustomPokedexListState();
}

class _CustomPokedexListState extends State<CustomPokedexList> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<PokedexBloc>(context).add(const GetCustomPokedexEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PokedexBloc, PokedexState>(
        builder: _buildPokedex,
      ),
    );
  }

  Widget _buildPokedex(BuildContext context, PokedexState state) {
    if (state is PokedexErrorState) {
      return Text(AppLocalization.of(context).tr('something_went_wrong'));
    }
    if (state is CustomPokedexLoadedState) {
      return PokedexGridView(pokemonList: state.pokedex);
    }
    return const CircularProgressIndicator();
  }
}
