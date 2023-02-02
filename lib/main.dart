import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/themes/bloc/theme_bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/screens/pokedex_screen.dart';
import 'package:flutterdex/injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.setup();
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
    home: const PokedexScreen(),
  );
}
