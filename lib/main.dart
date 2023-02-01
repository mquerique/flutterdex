import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/themes/app_themes.dart';
import 'package:flutterdex/core/themes/bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: const BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildApp,
      ),
    );
  }
}

Widget _buildApp(BuildContext context, ThemeState state) {
  return MaterialApp(
    title: 'FlutterDex',
    debugShowCheckedModeBanner: false,
    theme: state.themeData,
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('pt', 'BR'),
    ],
    localizationsDelegates: const [
      AppLocalization.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    localeResolutionCallback: (locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale?.languageCode &&
            supportedLocale.countryCode == locale?.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
    home: const MyHomePage(),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalization.tr('app_title')),
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
      ),
      body: Center(
        child: Text(
          appLocalization.tr('hello'),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
