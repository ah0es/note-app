import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 3,
      ), // Control the duration the SnackBar is shown
      backgroundColor: Colors.blueGrey, // Background color
      elevation: 6.0, // Add some elevation for a shadow effect
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      ), // Apply rounded corners at the top

      // Customized content with stars
      content: Row(
        children: [
          const Icon(Icons.star, color: Colors.yellow, size: 24.0),
          const SizedBox(width: 8.0),
          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}
