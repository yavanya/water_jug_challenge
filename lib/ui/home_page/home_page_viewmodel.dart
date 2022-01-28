import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:water_jug_challenge/models/jug_model.dart';
import 'package:water_jug_challenge/models/step_model.dart';
import 'package:water_jug_challenge/services/calc_service.dart';

class HomePageViewmodel extends BaseViewModel {
  // usually i use get_it for real apps
  final service = CalcService();

  final xController = TextEditingController();
  final yController = TextEditingController();
  final zController = TextEditingController();
  List<WaterStep> stepList = <WaterStep>[];
  int? xJugVol, yJugVol, zJugVol;

  bool? _isSolved;
  bool? get isSolved => _isSolved;
  set isSolved(bool? b) {
    _isSolved = b;
    notifyListeners();
  }

  bool _calculating = false;
  bool get calculating => _calculating;
  set calculating(bool b) {
    _calculating = b;
    notifyListeners();
  }

  bool _validate() {
    xJugVol = int.tryParse(xController.text);
    yJugVol = int.tryParse(yController.text);
    zJugVol = int.tryParse(zController.text);

    if (xJugVol == null ||
        yJugVol == null ||
        zJugVol == null ||
        xJugVol! > 9999999 ||
        yJugVol! > 9999999 ||
        zJugVol! > 9999999) {
      return false;
    } else {
      return true;
    }
  }

  void solve(BuildContext context) {
    if (_validate()) {
      final xJug = Jug(name: 'X Jug', maxVolume: xJugVol!);
      final yJug = Jug(name: 'Y Jug', maxVolume: yJugVol!);
      final target = zJugVol!;
      calculating = true;
      stepList = service.getMinSteps(xJug, yJug, target);
      calculating = false;
      isSolved = stepList.isNotEmpty;
    } else {
      showDialog<AlertDialog>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
