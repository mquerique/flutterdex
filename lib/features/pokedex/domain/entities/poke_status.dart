import 'package:equatable/equatable.dart';

class PokeStatus extends Equatable {
  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  const PokeStatus({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  @override
  List<Object?> get props => [
        hp,
        attack,
        defense,
        spAttack,
        spDefense,
        speed,
      ];
}
