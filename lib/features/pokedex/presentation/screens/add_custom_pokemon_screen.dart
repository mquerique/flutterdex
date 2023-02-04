import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/util/validators.dart';
import 'package:flutterdex/core/widgets/input_field.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';
import 'package:flutterdex/features/pokedex/presentation/blocs/pokedex_bloc.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_image_input.dart';
import 'package:flutterdex/features/pokedex/presentation/widgets/pokemon_type_selection.dart';

class AddCustomPokemonScreen extends StatefulWidget {
  const AddCustomPokemonScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomPokemonScreen> createState() => _AddCustomPokemonScreenState();
}

class _AddCustomPokemonScreenState extends State<AddCustomPokemonScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstAbilityController = TextEditingController();
  final TextEditingController _secondAbilityController =
      TextEditingController();
  final TextEditingController _thirdAbilityController = TextEditingController();

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(_appLocalization.tr('new_custom_pokemon')),
      ),
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocConsumer<PokedexBloc, PokedexState>(
        listener: (context, state) {
          if (state is CustomPokemonAddedState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return _buildForm();
        },
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                PokemonImageInput(
                  onChanged: (path) {
                    _imagePath = path;
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InputField(
                      controller: _nameController,
                      hintText: _appLocalization.tr('pokemon_name'),
                      validator: (val) {
                        return Validators.nullOrEmptyValidator(
                          context: context,
                          val: val,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: PokemonTypeSelection(
                  labelText: _appLocalization.tr('primary_type'),
                  onChanged: (val) {
                    if (val == null) return;
                    _firstType = val;
                  },
                  required: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PokemonTypeSelection(
                  labelText: _appLocalization.tr('secondary_type'),
                  onChanged: (val) {
                    if (val == null || val == _firstType) return;
                    _secondType = val;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: Text(
              _appLocalization.tr('abilities'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Column(
            children: [
              InputField(
                controller: _firstAbilityController,
                labelText: _appLocalization.tr('first_ability'),
                validator: (val) {
                  return Validators.nullOrEmptyValidator(
                    context: context,
                    val: val,
                  );
                },
              ),
              InputField(
                controller: _secondAbilityController,
                labelText: _appLocalization.tr('second_ability'),
              ),
              InputField(
                controller: _thirdAbilityController,
                labelText: _appLocalization.tr('third_ability'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleSave,
            child: Text(
              '${_appLocalization.tr('save')} ${_appLocalization.tr('pokemon')}!!',
            ),
          ),
        ],
      ),
    );
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) return;

    BlocProvider.of<PokedexBloc>(context).add(
      AddCustomPokemonEvent(
        name: _nameController.text,
        pokeTypes: [_firstType, _secondType].whereType<PokeType>().toList(),
        abilities: [
          _firstAbilityController.text,
          _secondAbilityController.text,
          _thirdAbilityController.text,
        ].where((it) => it.isNotEmpty).toList(),
        imagePath: _imagePath,
      ),
    );
  }
}
