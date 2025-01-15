import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String label;
  final Function onTap;
  final IconData iconData;
  const MenuItemWidget({
    super.key,
    required this.onTap,
    required this.label,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            SizedBox(width: 24, child: Icon(iconData)),
            const SizedBox(width: 12),
            Text(label),
          ]),
        ),
      ),
    );
  }
}
