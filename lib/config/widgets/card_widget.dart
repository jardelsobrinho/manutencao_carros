import 'package:flutter/material.dart';

class CardWidget extends Card {
  final List<Widget> children;
  final double spacing;
  const CardWidget({
    required this.children,
    this.spacing = 0.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: spacing,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
