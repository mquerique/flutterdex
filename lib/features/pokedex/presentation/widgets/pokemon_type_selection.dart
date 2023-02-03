import 'package:flutter/material.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';

class PokemonTypeSelection extends StatefulWidget {
  final void Function(PokeType?)? onChanged;

  const PokemonTypeSelection({
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonTypeSelection> createState() => _PokemonTypeSelectionState();
}

class _PokemonTypeSelectionState extends State<PokemonTypeSelection> {
  PokeType? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<PokeType?>(
      value: _dropdownValue,
      items: PokeType.values
          .map((it) =>
              DropdownMenuItem<PokeType>(value: it, child: Text(it.name)))
          .toList(),
      onChanged: (val) {
        setState(() => _dropdownValue = val);
        widget.onChanged?.call(val);
      },
    );
  }
}
