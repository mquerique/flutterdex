import 'package:flutter/material.dart';
import 'package:flutterdex/core/localization/app_localization.dart';
import 'package:flutterdex/features/pokedex/domain/entities/poke_status.dart';

class PokeStatBars extends StatelessWidget {
  final PokeStatus pokeStatus;
  final Color color;

  const PokeStatBars({
    required this.pokeStatus,
    this.color = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalization.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildBar(
                context: context,
                statName: appLocalization.tr('hp'),
                statValue: pokeStatus.hp,
              ),
              _buildBar(
                context: context,
                statName: appLocalization.tr('attack'),
                statValue: pokeStatus.attack,
              ),
              _buildBar(
                context: context,
                statName: appLocalization.tr('defense'),
                statValue: pokeStatus.defense,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              _buildBar(
                context: context,
                statName: appLocalization.tr('sp_attack'),
                statValue: pokeStatus.spAttack,
              ),
              _buildBar(
                context: context,
                statName: appLocalization.tr('sp_defense'),
                statValue: pokeStatus.spDefense,
              ),
              _buildBar(
                context: context,
                statName: appLocalization.tr('speed'),
                statValue: pokeStatus.speed,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBar({
    required BuildContext context,
    required String statName,
    required int statValue,
  }) {
    return Row(
      children: [
        Text(
          '$statName: ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        Expanded(
          child: Text(
            statValue.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}
