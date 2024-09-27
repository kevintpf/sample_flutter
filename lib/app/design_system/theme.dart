import 'package:flutter/material.dart';
import 'package:sample_flutter/app/app.dart';
import 'package:sample_flutter/assets_gen/fonts.gen.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  ),
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: FontFamily.plusJakarkaSans,
).copyWith(
  textTheme: textTheme,
  dividerTheme: DividerThemeData(color: Colors.black.withOpacity(0.1), space: 0, thickness: 1),
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.deepPurple.shade300,
    surfaceTintColor: Colors.transparent,
    foregroundColor: Colors.white,
  ),
);
