import 'package:flutter/material.dart';

/// color pallete
class Pallete {
  Pallete._();

  /// text color
  static const Color text = Color(0xFFFFFFFF);

  /// contrast color
  static const Color contrast = Color(0xFFFFFFFF);

  /// background color
  static const Color background = Color(0xFF030306);

  /// card-foregroud color
  static const Color foreground = Color(0xFF2D1D4D);

  /// primary color
  static const Color primary = Color(0xFFBE5AED);

  /// variant
  static const Color primaryVariant = Color(0xFFA018F2);

  /// secondary color
  static const Color secondary = Color(0xFF431C9E);

  /// variant
  static const Color secondaryVariant = Color(0xFF2617F2);

  /// error color
  static const Color error = Color(0xFFFF0000);
}

/// defines the app colorscheme
const ColorScheme appColorScheme = ColorScheme(
  primary: Pallete.primary,
  primaryVariant: Pallete.primaryVariant,
  secondary: Pallete.secondary,
  secondaryVariant: Pallete.secondaryVariant,
  surface: Pallete.foreground,
  background: Pallete.foreground,
  error: Pallete.error,
  onPrimary: Pallete.contrast,
  onSecondary: Pallete.contrast,
  onSurface: Pallete.contrast,
  onBackground: Pallete.contrast,
  onError: Pallete.contrast,
  brightness: Brightness.dark,
);

/// default theme for application
final ThemeData appTheme = ThemeData(
  colorScheme: appColorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
