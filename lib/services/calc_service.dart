import 'package:water_jug_challenge/models/enums/enums.dart';
import 'package:water_jug_challenge/models/jug_model.dart';
import 'package:water_jug_challenge/models/step_model.dart';

/// Service for solving Water Jugs Riddle
/// Customized to fit UI needs
class CalcService {
  final _ocean = Jug(
    name: 'Ocean',
    maxVolume: 9007199254740991,
    currentVolume: 9007199254740991,
  );

  int _getGcd(int x, int y) {
    if (y == 0) {
      return x;
    }

    final res = _getGcd(y, x % y);
    return res;
  }

  List<WaterStep> _getSteps(Jug x, Jug y, int target) {
    final steps = <WaterStep>[];

    while (x.currentVolume != target && y.currentVolume != target) {
      if (x.isEmpty) {
        x.fill();

        steps.add(
          WaterStep(
            action: WaterAction.fill,
            fromJug: _ocean.name,
            fromJugVolume: _ocean.currentVolume,
            toJug: x.name,
            toJugVolume: x.currentVolume,
          ),
        );
      }

      final transferred = y.transferIn(
        x.currentVolume > y.maxVolume ? y.maxVolume : x.currentVolume,
      );

      x.transferOut(transferred);

      steps.add(
        WaterStep(
          action: WaterAction.transfer,
          fromJug: x.name,
          fromJugVolume: x.currentVolume,
          toJug: y.name,
          toJugVolume: y.currentVolume,
        ),
      );

      if (x.currentVolume == target || y.currentVolume == target) {
        break;
      }

      if (y.isFull && x.isEmpty) {
        y.transferOut(
          x.maxVolume > y.maxVolume ? y.currentVolume : x.currentVolume,
        );

        steps.add(
          WaterStep(
            action: WaterAction.transfer,
            fromJug: y.name,
            fromJugVolume: y.currentVolume,
            toJug: x.name,
            toJugVolume: x.currentVolume,
          ),
        );
      }

      if (y.isFull && !x.isEmpty) {
        y.currentVolume = 0;

        steps.add(
          WaterStep(
            action: WaterAction.empty,
            fromJug: y.name,
            fromJugVolume: y.currentVolume,
            toJug: _ocean.name,
            toJugVolume: _ocean.currentVolume,
          ),
        );
      }
    }
    return steps;
  }

  ///
  List<WaterStep> getMinSteps(Jug a, Jug b, int target) {
    final xMax = a.maxVolume;
    final yMax = b.maxVolume;
    Jug reassignedA;
    Jug reassignedB;

    if (xMax > yMax) {
      final temp = a;
      reassignedA = b;
      reassignedB = temp;
    } else {
      reassignedA = a;
      reassignedB = b;
    }

    if (target > reassignedA.maxVolume && target > reassignedB.maxVolume) {
      return <WaterStep>[];
    }

    final gcd = _getGcd(reassignedB.maxVolume, reassignedA.maxVolume);

    if (target % gcd != 0) {
      return <WaterStep>[];
    }

    if (target > yMax) {
      return <WaterStep>[];
    }

    final xSteps = _getSteps(reassignedA, reassignedB, target);
    a.currentVolume = 0;
    b.currentVolume = 0;
    final ySteps = _getSteps(reassignedB, reassignedA, target);

    if (xSteps.length > ySteps.length) {
      return ySteps;
    } else {
      return xSteps;
    }
  }
}
