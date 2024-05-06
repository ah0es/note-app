import 'package:flutter/material.dart';

class ItemColor extends StatelessWidget {
  const ItemColor({super.key, required this.color, required this.isActive});
  final Color color;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Color(color.value),
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: Color(color.value),
          );
  }
}
