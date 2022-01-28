import 'package:water_jug_challenge/models/enums/enums.dart';

/// WaterStep class, used for UI
class WaterStep {
  /// WaterStep Constructor
  WaterStep({
    required this.action,
    required this.fromJug,
    required this.fromJugVolume,
    required this.fromJugMax,
    required this.toJug,
    required this.toJugVolume,
    required this.toJugMax,
  });

  final WaterAction action;
  final String fromJug;
  final int fromJugVolume;
  final int fromJugMax;
  final String toJug;
  final int toJugVolume;
  final int toJugMax;

  String get explanation {
    final actionString = action.name;

    actionString.replaceFirst(
      actionString[0],
      actionString[0].toUpperCase(),
    );

    switch (action) {
      case WaterAction.empty:
        return '$actionString $fromJugMax gal Jug to the Ocean';

      case WaterAction.fill:
        return '$actionString $toJugMax gal Jug from the Ocean';

      case WaterAction.transfer:
        return '$actionString from $fromJugMax gal Jug to $toJugMax gal Jug';
    }
  }
}
