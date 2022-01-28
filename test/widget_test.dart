// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:water_jug_challenge/models/jug_model.dart';
import 'package:water_jug_challenge/models/step_model.dart';
import 'package:water_jug_challenge/services/calc_service.dart';

void main() {
  final service = CalcService();

  test('solve 2 10 4', () {
    expect(
      service.getMinSteps(
        Jug(name: 'X', maxVolume: 2),
        Jug(name: 'Y', maxVolume: 10),
        4,
      ),
      (List<WaterStep> res) => res.length == 4,
    );
  });

  test('solve 2 3 4', () {
    expect(
      service.getMinSteps(
        Jug(name: 'X', maxVolume: 2),
        Jug(name: 'Y', maxVolume: 3),
        4,
      ),
      (List<WaterStep> res) => res.isEmpty,
    );
  });

  test('solve 5 22 2', () {
    expect(
      service.getMinSteps(
        Jug(name: 'X', maxVolume: 5),
        Jug(name: 'Y', maxVolume: 22),
        2,
      ),
      (List<WaterStep> res) => res.length == 8,
    );
  });

  test('solve 3 5 4', () {
    expect(
      service.getMinSteps(
        Jug(name: 'X', maxVolume: 3),
        Jug(name: 'Y', maxVolume: 5),
        4,
      ),
      (List<WaterStep> res) => res.length == 6,
    );
  });
}
