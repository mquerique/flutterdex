import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    title: 'Flutter Demo',
    theme: state.themeData,
    home: const MyHomePage(),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutterdex'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (ctx) {
              return [
                const PopupMenuItem(
                  value: AppTheme.light,
                  child: Text("Light"),
                ),
                const PopupMenuItem(
                  value: AppTheme.dark,
                  child: Text("Dark"),
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
          'Hello!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
