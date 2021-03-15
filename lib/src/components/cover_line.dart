import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoverLine extends StatelessWidget {
  final Alignment alignment;
  final double height;

  const CoverLine(
      {this.alignment = Alignment.topCenter, this.height = 16, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: alignment,
            end: Alignment(alignment.x, 1 - alignment.y),
            colors: [
              Theme.of(context).canvasColor,
              Theme.of(context).canvasColor.withOpacity(0)
            ],
          ),
        ),
      ),
    );
  }
}
