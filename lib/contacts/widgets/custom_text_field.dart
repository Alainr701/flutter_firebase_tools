import 'package:flutter/material.dart';

class CustomTextField {
  static InputDecoration style({
    required String labelText,
  }) =>
      InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
