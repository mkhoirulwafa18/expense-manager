import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamily = 'Poppins';

  /// Text style for body
  static const TextStyle bodyLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle bodyXs = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );

  /// Text style for heading

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
