import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/themes/app_themes.dart';
import 'package:flutterdex/core/themes/bloc/theme_bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/screens/add_custom_pokemon_screen.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/custom_pokedex_list.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokedex_list.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final appLocalization = AppLocalization.of(context);

    return AppBar(
      title: Text(appLocalization.tr('app_title')),
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (ctx) {
            return [
              PopupMenuItem(
                value: AppTheme.light,
                child: Text(appLocalization.tr('light_mode')),
              ),
              PopupMenuItem(
                value: AppTheme.dark,
                child: Text(appLocalization.tr('dark_mode')),
              ),
            ];
          },
          onSelected: (theme) {
            BlocProvider.of<ThemeBloc>(context).add(
              ThemeChanged(theme: theme),
            );
          },
        ),
      ],
      bottom: TabBar(
        indicatorColor: Theme.of(context).colorScheme.onPrimary,
        onTap: (tabIndex) {
          setState(() {
            _tabIndex = tabIndex;
          });
        },
        tabs: [
          Tab(
              child: Text(
            appLocalization.tr('pokemon'),
            style: const TextStyle(fontSize: 16),
          )),
          Tab(
              child: Text(
            appLocalization.tr('custom_pokemon'),
            style: const TextStyle(fontSize: 16),
          )),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return const TabBarView(
      children: [
        PokedexList(),
        CustomPokedexList(),
      ],
    );
  }

  Widget? _buildFloatingActionButton() {
    if (_tabIndex != 1) return null;
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddCustomPokemonScreen()),
        );
      },
    );
  }
}
