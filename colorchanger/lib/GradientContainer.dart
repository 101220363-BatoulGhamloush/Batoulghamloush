import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget { // ✅ NO UNDERSCORE
  final Color color;
  final Alignment begin;
  final Alignment end;
  final Widget child;

  const GradientContainer({
    super.key,
    required this.color,
    required this.begin,
    required this.end,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, Colors.black],
          begin: begin,
          end: end,
        ),
      ),
      child: child,
    );
  }
}
