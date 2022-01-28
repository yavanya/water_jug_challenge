import 'package:flutter/material.dart';

class JugWidget extends StatelessWidget {
  const JugWidget({
    required this.maxVolume,
    required this.currenVolume,
    required this.name,
    Key? key,
  }) : super(key: key);

  final int maxVolume;
  final int currenVolume;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 4,
              ),
              right: BorderSide(
                width: 4,
              ),
              bottom: BorderSide(
                width: 4,
              ),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: maxVolume / currenVolume,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
