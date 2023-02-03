import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/widgets/input_field.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/pokedex_bloc.dart';
import 'package:flutterdex/injection_container.dart';

class AddCustomPokemonScreen extends StatefulWidget {
  const AddCustomPokemonScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomPokemonScreen> createState() => _AddCustomPokemonScreenState();
}

class _AddCustomPokemonScreenState extends State<AddCustomPokemonScreen> {
  final TextEditingController _nameController = TextEditingController();
  late AppLocalization _appLocalization;

  @override
  void didChangeDependencies() {
    _appLocalization = AppLocalization.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appLocalization.tr('new_custom_pokemon')),
      ),
      body: BlocProvider(
        create: (_) => getIt<PokedexBloc>(),
        child: SingleChildScrollView(
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<PokedexBloc, PokedexState>(
      listener: (context, state) {
        // TODO(mquerique): add pop() after pokemon is added
      },
      builder: (context, state) {
        return Column(
          children: [
            InputField(controller: _nameController),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<PokedexBloc>(context).add(
                  const AddCustomPokemonEvent(
                    name: 'A test',
                    pokeTypes: [PokeType.normal],
                    abilities: [
                      'First ability',
                      'Second ability',
                    ],
                  ),
                );
              },
              child: Text('Add Pokémon!'),
            ),
          ],
        );
      },
    );
  }
}
