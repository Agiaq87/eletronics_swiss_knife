
import 'package:flutter/material.dart';

class TextStyleProvider {
  static final TextStyleProvider instance = TextStyleProvider._();

  TextStyleProvider._();

  TextStyle regular() =>
      const TextStyle(
        fontSize: 12.0
      );
}