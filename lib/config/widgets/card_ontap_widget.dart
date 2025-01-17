import 'package:flutter/material.dart';

class CardOnTapWidget extends Card {
  final List<Widget> children;
  final Function? onTap;
  const CardOnTapWidget({
    required this.children,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
