import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ----------------
/// Status Bar Color
/// ----------------
void setStatusBar({
  Brightness brightness = Brightness.dark,
  Color color = Colors.transparent,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
    ),
  );
}
