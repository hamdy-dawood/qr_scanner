import 'package:flutter/material.dart';

class BuildResult extends StatelessWidget {
  const BuildResult({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        maxLines: 3,
      ),
    );
  }
}
