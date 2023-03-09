import 'package:flutter/material.dart';

class BuildControlButtons extends StatelessWidget {
  const BuildControlButtons(
      {Key? key,
      required this.flashPressed,
      required this.cameraPressed,
      required this.flashIcon,
      required this.cameraIcon})
      : super(key: key);
  final VoidCallback flashPressed;
  final VoidCallback cameraPressed;
  final Widget flashIcon;
  final Widget cameraIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: flashPressed,
            icon: flashIcon,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: cameraPressed,
            icon: cameraIcon,
          ),
        ),
      ],
    );
  }
}
