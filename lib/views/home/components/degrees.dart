import 'package:flutter/material.dart';

class Degree extends StatelessWidget {
  const Degree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.blue,
        ),
        Positioned(
          top: 4,
          left: 4,
          right: 4,
          bottom: 4,
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
