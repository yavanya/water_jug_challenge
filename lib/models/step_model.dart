import 'package:water_jug_challenge/models/enums/enums.dart';

/// WaterStep class, used for UI
class WaterStep {
  /// WaterStep Constructor
  WaterStep({
    required this.action,
    required this.fromJug,
    required this.fromJugVolume,
    required this.toJug,
    required this.toJugVolume,
  });

  final WaterAction action;
  final String fromJug;
  final int fromJugVolume;
  final String toJug;
  final int toJugVolume;

  String get explanation {
    final actionString = action.toString();

    actionString.replaceFirst(
      actionString[0],
      actionString[0].toUpperCase(),
    );

    switch (action) {
      case WaterAction.empty:
        return '$actionString $fromJug';

      case WaterAction.fill:
        return '$actionString $toJug';

      case WaterAction.transfer:
        return '$actionString from $fromJug to $toJug';
    }
  }
}
