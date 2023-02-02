import 'package:equatable/equatable.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';

class Pokemon extends Equatable {
  final String name;
  final List<PokeType> pokeTypes;
  final List<String> abilities;
  final String? imageUrl;

  const Pokemon({
    required this.name,
    required this.pokeTypes,
    required this.abilities,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        pokeTypes,
        abilities,
        imageUrl,
      ];
}
