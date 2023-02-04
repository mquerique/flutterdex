import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/util/string_extension.dart';
import 'package:flutterdex/features/pokedex/domain/entities/custom_pokemon.dart';
import 'package:flutterdex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/poke_stat_bars.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_image.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_type_badge.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  late AppLocalization _appLocalization;

  bool get _isCustom => widget.pokemon is CustomPokemon;

  Color get _typeColor => widget.pokemon.pokeTypes[0].color;

  @override
  void didChangeDependencies() {
    _appLocalization = AppLocalization.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokedexBloc, PokedexState>(
      listener: (context, state) {
        if (state is CustomPokemonRemovedState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: _buildBody(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _typeColor.withOpacity(0.8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.pokemon.name.capitalize(),
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      actions: _isCustom
          ? <Widget>[
              PopupMenuButton(
                itemBuilder: (ctx) {
                  return [
                    PopupMenuItem(
                      child: Text(_appLocalization.tr('delete')),
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _showDeleteConfirmation();
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
        _buildImage(),
        _buildContent(),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: _typeColor.withOpacity(0.8),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white38,
          shape: BoxShape.circle,
        ),
        child: PokemonImage(
          pokemon: widget.pokemon,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.pokemon.pokeTypes
                .map((it) => PokemonTypeBadge(pokeType: it))
                .toList(),
          ),
          const SizedBox(height: 16),
          _buildInfo(),
          const SizedBox(height: 16),
          if (!_isCustom)
            _buildContentSection(
              title: _appLocalization.tr('base_stats'),
              children: [
                PokeStatBars(pokeStatus: widget.pokemon.stats!),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_isCustom)
              Expanded(
                child: _buildContentSection(
                  title: _appLocalization.tr('info'),
                  children: [
                    Text(
                      '${_appLocalization.tr('height')}: ${widget.pokemon.height} m',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${_appLocalization.tr('weight')}: ${widget.pokemon.weight} kg',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            Expanded(
              child: _buildContentSection(
                title: _appLocalization.tr('abilities'),
                children: widget.pokemon.abilities
                    .map(
                      (it) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          it.capitalize(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContentSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: _typeColor,
              ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmation() async {
    return showDialog<void>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(_appLocalization.tr('warning')),
          content: Text(_appLocalization.tr('pokemon_delete_confirmation')),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(_appLocalization.tr('cancel')),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<PokedexBloc>(ctx).add(
                  RemoveCustomPokemonEvent(
                      id: (widget.pokemon as CustomPokemon).id),
                );
                Navigator.of(ctx).pop();
              },
              child: Text(_appLocalization.tr('delete')),
            ),
          ],
        );
      },
    );
  }
}
