import 'package:flutter/material.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/core/util/string_extension.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';

class PokemonTypeSelection extends StatefulWidget {
  final void Function(PokeType?)? onChanged;
  final String? labelText;
  final bool required;

  const PokemonTypeSelection({
    this.onChanged,
    this.labelText,
    this.required = false,
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonTypeSelection> createState() => _PokemonTypeSelectionState();
}

class _PokemonTypeSelectionState extends State<PokemonTypeSelection> {
  PokeType? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<PokeType?>(
      decoration: InputDecoration(
        labelText: widget.labelText,
        isDense: true,
      ),
      isExpanded: true,
      value: _dropdownValue,
      items: PokeType.values
          .map((it) => DropdownMenuItem<PokeType>(
                value: it,
                child: Text(it.name.capitalize()),
              ))
          .toList(),
      onChanged: (val) {
        setState(() => _dropdownValue = val);
        widget.onChanged?.call(val);
      },
      validator: (value) {
        if (widget.required && value == null) {
          return AppLocalization.of(context).tr('err_field_required');
        }
        return null;
      },
    );
  }
}
