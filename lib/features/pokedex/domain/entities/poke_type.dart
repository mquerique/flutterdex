import 'dart:ui';

enum PokeType {
  bug(Color(0xFFA8B820), 'bug'),
  dark(Color(0xFF705848), 'dark'),
  dragon(Color(0xFF7038F8), 'dragon'),
  electric(Color(0xFFF8D030), 'electric'),
  fairy(Color(0xFFEE99AC), 'fairy'),
  fighting(Color(0xFFC03028), 'fighting'),
  fire(Color(0xFFF08030), 'fire'),
  flying(Color(0xFFA890F0), 'flying'),
  ghost(Color(0xFF705898), 'ghost'),
  grass(Color(0xFF78C850), 'grass'),
  ground(Color(0xFFE0C068), 'ground'),
  ice(Color(0xFF98D8D8), 'ice'),
  normal(Color(0xFFA8A878), 'normal'),
  poison(Color(0xFFA040A0), 'poison'),
  psychic(Color(0xFFF85888), 'psychic'),
  rock(Color(0xFFB8A038), 'rock'),
  steel(Color(0xFFB8B8D0), 'steel'),
  water(Color(0xFF6890F0), 'water');

  final Color color;
  final String type;

  const PokeType(
    this.color,
    this.type,
  );
}
