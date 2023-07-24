import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/font_families.dart';

const CupertinoThemeData cupertinoTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  applyThemeToAll: true,
  textTheme: CupertinoTextThemeData(
    primaryColor: kPrimaryColor,
    textStyle: TextStyle(fontFamily: kRobotoMonoFamily),
  ),
  scaffoldBackgroundColor: kBgColor,
  primaryColor: kPrimaryColor,
);
final ThemeData theme = ThemeData(
  useMaterial3: true,
  cupertinoOverrideTheme: cupertinoTheme,
  fontFamily: kRobotoMonoFamily,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFB870),
    onPrimary: Color(0xFF4A2800),
    primaryContainer: Color(0xFF693C00),
    onPrimaryContainer: Color(0xFFFFDCBE),
    secondary: Color(0xFFF1BF48),
    onSecondary: Color(0xFF3F2E00),
    secondaryContainer: Color(0xFF5B4300),
    onSecondaryContainer: Color(0xFFFFDF9C),
    tertiary: Color(0xFF69DBAE),
    onTertiary: Color(0xFF003827),
    tertiaryContainer: Color(0xFF00513A),
    onTertiaryContainer: Color(0xFF87F8C9),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF251A00),
    onBackground: Color(0xFFFFDF9C),
    surface: Color(0xFF251A00),
    onSurface: Color(0xFFFFDF9C),
    surfaceVariant: Color(0xFF51453A),
    onSurfaceVariant: Color(0xFFD5C3B5),
    outline: Color(0xFF9D8E81),
    onInverseSurface: Color(0xFF251A00),
    inverseSurface: Color(0xFFFFDF9C),
    inversePrimary: Color(0xFF8A5000),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFFFB870),
    outlineVariant: Color(0xFF51453A),
    scrim: Color(0xFF000000),
  ),
);
