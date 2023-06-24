import 'package:flutter/material.dart';

import 'widgets.dart';

abstract class Styles {
  static InputDecoration fieldDecoration({
    String? label,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(borderRadius: Widgets.roundedBorder),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      labelText: label,
      suffixIcon: suffixIcon,
    );
  }
}
