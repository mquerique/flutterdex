import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final List<String> pokeType;
  final List<String> abilities;
  final String? imageUrl;

  const Pokemon({
    required this.name,
    required this.pokeType,
    required this.abilities,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        pokeType,
        abilities,
        imageUrl,
      ];
}
