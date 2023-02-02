import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/themes/app_themes.dart';
import 'package:flutterdex/core/themes/bloc/theme_bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokedex_list.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const PokedexListview(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final appLocalization = AppLocalization.of(context);

    return AppBar(
      title: Text(appLocalization.tr('pokedex')),
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
    );
  }
}
