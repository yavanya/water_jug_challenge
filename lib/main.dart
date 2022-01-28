import 'package:flutter/material.dart';
import 'package:water_jug_challenge/ui/home_page/home_page.dart';

/* Since the UI in this project is very simple,
please allow me not to document it */
void main() {
  runApp(const WaterRiddleApp());
}

class WaterRiddleApp extends StatelessWidget {
  const WaterRiddleApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
