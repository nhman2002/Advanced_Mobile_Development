import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 209, 108, 230),
    foregroundColor: Color(4294967295),
    titleTextStyle: TextStyle(
      color: Color(4294967295),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    iconTheme: IconThemeData(
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  ),

);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 84, 31, 128),
    foregroundColor: Color(4293059305),
    titleTextStyle: TextStyle(
      color: Color(4293059305),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    iconTheme: IconThemeData(
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  ),
);

const lightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(4282474385),
  surfaceTint: Color(4282474385),
  onPrimary: Color(4294967295),
  primaryContainer: Color(4292273151),
  onPrimaryContainer: Color(4278197054),
  secondary: Color(4283850609),
  onSecondary: Color(4294967295),
  secondaryContainer: Color(4292535033),
  onSecondaryContainer: Color(4279442475),
  tertiary: Color(4285551989),
  onTertiary: Color(4294967295),
  tertiaryContainer: Color(4294629629),
  onTertiaryContainer: Color(4280816430),
  error: Color(4290386458),
  onError: Color(4294967295),
  errorContainer: Color(4294957782),
  onErrorContainer: Color(4282449922),
  background: Color(4294572543),
  onBackground: Color(4279835680),
  surface: Color(4294572543),
  onSurface: Color(4279835680),
  surfaceVariant: Color(4292928236),
  onSurfaceVariant: Color(4282664782),
  outline: Color(4285822847),
  outlineVariant: Color(4291086032),
  shadow: Color(4278190080),
  scrim: Color(4278190080),
  inverseSurface: Color(4281217078),
  inversePrimary: Color(4289382399),
);
const darkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(4289382399),
  surfaceTint: Color(4289382399),
  onPrimary: Color(4278857823),
  primaryContainer: Color(4280829815),
  onPrimaryContainer: Color(4292273151),
  secondary: Color(4290692828),
  onSecondary: Color(4280824129),
  secondaryContainer: Color(4282271577),
  onSecondaryContainer: Color(4292535033),
  tertiary: Color(4292721888),
  onTertiary: Color(4282329156),
  tertiaryContainer: Color(4283907676),
  onTertiaryContainer: Color(4294629629),
  error: Color(4294948011),
  onError: Color(4285071365),
  errorContainer: Color(4287823882),
  onErrorContainer: Color(4294957782),
  background: Color(4279309080),
  onBackground: Color(4293059305),
  surface: Color(4279309080),
  onSurface: Color(4293059305),
  surfaceVariant: Color(4282664782),
  onSurfaceVariant: Color(4291086032),
  outline: Color(4287533209),
  outlineVariant: Color(4282664782),
  shadow: Color(4278190080),
  scrim: Color(4278190080),
  inverseSurface: Color(4293059305),
  inversePrimary: Color(4282474385),
);