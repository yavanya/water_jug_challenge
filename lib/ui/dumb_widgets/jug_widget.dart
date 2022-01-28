import 'package:flutter/material.dart';

class JugWidget extends StatelessWidget {
  const JugWidget({
    required this.maxVolume,
    required this.currentVolume,
    required this.name,
    Key? key,
  }) : super(key: key);

  final int maxVolume;
  final int currentVolume;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 102,
          width: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                width: 2,
              ),
              right: BorderSide(
                width: 2,
              ),
              bottom: BorderSide(
                width: 2,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          height: 100 * (currentVolume / maxVolume) > 100
              ? 96
              : 100 * (currentVolume / maxVolume),
          width: 56,
          decoration: const BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
        ),
        SizedBox(
          width: 55,
          child: Text(name.isEmpty ? '$maxVolume gal Jug' : 'Ocean'),
        ),
      ],
    );
  }
}
