import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/util/string_extension.dart';
import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_image.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_type_badge.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  bool get isCustom => pokemon is CustomPokemon;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokedexBloc, PokedexState>(
      listener: (context, state) {
        if (state is CustomPokemonRemovedState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: _buildBody(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(pokemon.name.capitalize()),
      actions: isCustom
          ? <Widget>[
              PopupMenuButton(
                itemBuilder: (ctx) {
                  final appLocalization = AppLocalization.of(ctx);
                  return [
                    PopupMenuItem(
                      child: Text(appLocalization.tr('delete')),
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _showDeleteConfirmation(context);
                        });
                      },
                    ),
                  ];
                },
              ),
            ]
          : null,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Text(pokemon.name),
        PokemonImage(pokemon: pokemon),
        Row(
          children: pokemon.pokeTypes
              .map(
                (it) => PokemonTypeBadge(pokeType: it),
              )
              .toList(),
        ),
        Row(
          children: pokemon.abilities.map((it) => Text(it)).toList(),
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (ctx) {
        final appLocalization = AppLocalization.of(ctx);

        return AlertDialog(
          title: Text(appLocalization.tr('warning')),
          content: Text(appLocalization.tr('pokemon_delete_confirmation')),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(appLocalization.tr('cancel')),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<PokedexBloc>(ctx).add(
                  RemoveCustomPokemonEvent(id: (pokemon as CustomPokemon).id),
                );
                Navigator.of(ctx).pop();
              },
              child: Text(appLocalization.tr('delete')),
            ),
          ],
        );
      },
    );
  }
}
