import 'dart:ui';

enum PokeType {
  bug(Color(0xFFA8B820)),
  dark(Color(0xFF705848)),
  dragon(Color(0xFF7038F8)),
  electric(Color(0xFFF8D030)),
  fairy(Color(0xFFEE99AC)),
  fighting(Color(0xFFC03028)),
  fire(Color(0xFFF08030)),
  flying(Color(0xFFA890F0)),
  ghost(Color(0xFF705898)),
  grass(Color(0xFF78C850)),
  ground(Color(0xFFE0C068)),
  ice(Color(0xFF98D8D8)),
  normal(Color(0xFFA8A878)),
  poison(Color(0xFFA040A0)),
  psychic(Color(0xFFF85888)),
  rock(Color(0xFFB8A038)),
  steel(Color(0xFFB8B8D0)),
  water(Color(0xFF6890F0));

  final Color color;

  const PokeType(
    this.color,
  );
}
