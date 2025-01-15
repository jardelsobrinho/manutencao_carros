import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final List<Widget> children;
  const MenuWidget({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: children,
            ),
          ),
        )
      ],
    );
  }
}
