import 'package:flutter/material.dart';

enum DividerDirection { horizontal, vertical }

class WDivider extends StatelessWidget {
  final Color? color;
  final DividerDirection direction;
  const WDivider({
    this.direction = DividerDirection.horizontal,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isHorizontal = direction == DividerDirection.horizontal;
    return Container(
      height: isHorizontal ? 1 : double.maxFinite,
      width: isHorizontal ? double.maxFinite : 1,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onPrimary.withOpacity(.2),
      ),
    );
  }
}