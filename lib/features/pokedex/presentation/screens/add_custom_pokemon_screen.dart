import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/widgets/input_field.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/pokedex_bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_type_selection.dart';

class AddCustomPokemonScreen extends StatefulWidget {
  const AddCustomPokemonScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomPokemonScreen> createState() => _AddCustomPokemonScreenState();
}

class _AddCustomPokemonScreenState extends State<AddCustomPokemonScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _imagePath;
  PokeType? _firstType;
  PokeType? _secondType;

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
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<PokedexBloc, PokedexState>(
      listener: (context, state) {
        if (state is CustomPokemonAddedState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            _buildImagePicker(),
            InputField(controller: _nameController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PokemonTypeSelection(
                  onChanged: (val) {
                    if (val == null) return;
                    _firstType = val;
                  },
                ),
                PokemonTypeSelection(
                  onChanged: (val) {
                    if (val == null || val == _firstType) return;
                    _secondType = val;
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<PokedexBloc>(context).add(
                  AddCustomPokemonEvent(
                    name: _nameController.text,
                    pokeTypes: [_firstType, _secondType]
                        .whereType<PokeType>()
                        .toList(),
                    abilities: const [
                      'First ability',
                      'Second ability',
                    ],
                    imagePath: _imagePath,
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

  Widget _buildImagePicker() {
    return ElevatedButton(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        _imagePath = result?.files.single.path;
      },
      child: const Icon(Icons.image_outlined),
    );
  }
}
