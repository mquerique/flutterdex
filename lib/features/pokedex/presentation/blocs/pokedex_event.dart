part of 'pokedex_bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object?> get props => [];
}

class GetPokedexEvent extends PokedexEvent {
  final int offset;
  final int limit;

  const GetPokedexEvent({
    this.offset = 0,
    required this.limit,
  });

  @override
  List<Object?> get props => [offset, limit];
}
