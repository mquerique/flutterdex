import 'package:equatable/equatable.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_status.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_type.dart';

class Pokemon extends Equatable {
  final String name;
  final List<PokeType> pokeTypes;
  final List<String> abilities;
  final String? imageUrl;
  final PokeStatus? stats;
  final double? height;
  final double? weight;

  const Pokemon({
    required this.name,
    required this.pokeTypes,
    required this.abilities,
    this.imageUrl,
    this.stats,
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [
        name,
        pokeTypes,
        abilities,
        imageUrl,
        stats,
        height,
        weight,
      ];
}
