import 'package:flutterdex/features/pokedex/domain/entities/poke_status.dart';

class PokeStatusModel extends PokeStatus {
  const PokeStatusModel({
    required super.hp,
    required super.attack,
    required super.defense,
    required super.spAttack,
    required super.spDefense,
    required super.speed,
  });

  factory PokeStatusModel.fromJsonArray(List<Map<String, dynamic>> jsonArray) {
    return PokeStatusModel(
      hp: jsonArray[0]['base_stat'],
      attack: jsonArray[1]['base_stat'],
      defense: jsonArray[2]['base_stat'],
      spAttack: jsonArray[3]['base_stat'],
      spDefense: jsonArray[4]['base_stat'],
      speed: jsonArray[5]['base_stat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'spAttack': spAttack,
      'spDefense': spDefense,
      'speed': speed,
    };
  }
}
