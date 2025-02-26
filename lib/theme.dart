import "package:flutter/material.dart";

class MaterialTheme {

  const MaterialTheme();

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff795900),
      surfaceTint: Color(0xff795900),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffbc02d),
      onPrimaryContainer: Color(0xff6c5000),
      secondary: Color(0xff795900),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffbc02d),
      onSecondaryContainer: Color(0xff6c5000),
      tertiary: Color(0xff605e5d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff1edec),
      onTertiaryContainer: Color(0xff6d6b6a),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff464742),
      outline: Color(0xff777771),
      outlineVariant: Color(0xffc7c7bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xfff8bd2a),
      primaryFixed: Color(0xffffdfa0),
      onPrimaryFixed: Color(0xff261a00),
      primaryFixedDim: Color(0xfff8bd2a),
      onPrimaryFixedVariant: Color(0xff5c4300),
      secondaryFixed: Color(0xffffdfa0),
      onSecondaryFixed: Color(0xff261a00),
      secondaryFixedDim: Color(0xfff8bd2a),
      onSecondaryFixedVariant: Color(0xff5c4300),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff1c1b1b),
      tertiaryFixedDim: Color(0xffc9c6c5),
      onTertiaryFixedVariant: Color(0xff484646),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e6),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff473300),
      surfaceTint: Color(0xff795900),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8b6700),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff473300),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8b6700),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff373635),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6e6d6c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff363732),
      outline: Color(0xff52534d),
      outlineVariant: Color(0xff6d6d67),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xfff8bd2a),
      primaryFixed: Color(0xff8b6700),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6d5000),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8b6700),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6d5000),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6e6d6c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff565454),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c5),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xffebe7e6),
      surfaceContainerHigh: Color(0xffe0dcdb),
      surfaceContainerHighest: Color(0xffd4d1d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3a2900),
      surfaceTint: Color(0xff795900),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f4500),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3a2900),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5f4500),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2d2c2c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4a4948),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2b2d28),
      outlineVariant: Color(0xff494a44),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xfff8bd2a),
      primaryFixed: Color(0xff5f4500),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff433000),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5f4500),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff433000),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4a4948),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff333232),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b7),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0ef),
      surfaceContainer: Color(0xffe5e2e1),
      surfaceContainerHigh: Color(0xffd7d4d3),
      surfaceContainerHighest: Color(0xffc9c6c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffe2aa),
      surfaceTint: Color(0xfff8bd2a),
      onPrimary: Color(0xff402d00),
      primaryContainer: Color(0xfffbc02d),
      onPrimaryContainer: Color(0xff6c5000),
      secondary: Color(0xffffe2aa),
      onSecondary: Color(0xff402d00),
      secondaryContainer: Color(0xfffbc02d),
      onSecondaryContainer: Color(0xff6c5000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff313030),
      tertiaryContainer: Color(0xffe5e2e1),
      onTertiaryContainer: Color(0xff666463),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc7c7bf),
      outline: Color(0xff91918a),
      outlineVariant: Color(0xff464742),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff795900),
      primaryFixed: Color(0xffffdfa0),
      onPrimaryFixed: Color(0xff261a00),
      primaryFixedDim: Color(0xfff8bd2a),
      onPrimaryFixedVariant: Color(0xff5c4300),
      secondaryFixed: Color(0xffffdfa0),
      onSecondaryFixed: Color(0xff261a00),
      secondaryFixedDim: Color(0xfff8bd2a),
      onSecondaryFixedVariant: Color(0xff5c4300),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff1c1b1b),
      tertiaryFixedDim: Color(0xffc9c6c5),
      onTertiaryFixedVariant: Color(0xff484646),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff363434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffe2aa),
      surfaceTint: Color(0xfff8bd2a),
      onPrimary: Color(0xff3a2900),
      primaryContainer: Color(0xfffbc02d),
      onPrimaryContainer: Color(0xff493500),
      secondary: Color(0xffffe2aa),
      onSecondary: Color(0xff3a2900),
      secondaryContainer: Color(0xfffbc02d),
      onSecondaryContainer: Color(0xff493500),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff313030),
      tertiaryContainer: Color(0xffe5e2e1),
      onTertiaryContainer: Color(0xff494847),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffddddd5),
      outline: Color(0xffb2b2ab),
      outlineVariant: Color(0xff91918a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff5d4400),
      primaryFixed: Color(0xffffdfa0),
      onPrimaryFixed: Color(0xff191000),
      primaryFixedDim: Color(0xfff8bd2a),
      onPrimaryFixedVariant: Color(0xff473300),
      secondaryFixed: Color(0xffffdfa0),
      onSecondaryFixed: Color(0xff191000),
      secondaryFixedDim: Color(0xfff8bd2a),
      onSecondaryFixedVariant: Color(0xff473300),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff111111),
      tertiaryFixedDim: Color(0xffc9c6c5),
      onTertiaryFixedVariant: Color(0xff373635),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff454444),
      surfaceContainerLowest: Color(0xff080707),
      surfaceContainerLow: Color(0xff1e1d1d),
      surfaceContainer: Color(0xff282827),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3f3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffeed2),
      surfaceTint: Color(0xfff8bd2a),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfffbc02d),
      onPrimaryContainer: Color(0xff1d1300),
      secondary: Color(0xffffeed2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfffbc02d),
      onSecondaryContainer: Color(0xff1d1300),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe5e2e1),
      onTertiaryContainer: Color(0xff2b2a29),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1f0e8),
      outlineVariant: Color(0xffc3c3bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff5d4400),
      primaryFixed: Color(0xffffdfa0),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff8bd2a),
      onPrimaryFixedVariant: Color(0xff191000),
      secondaryFixed: Color(0xffffdfa0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfff8bd2a),
      onSecondaryFixedVariant: Color(0xff191000),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc9c6c5),
      onTertiaryFixedVariant: Color(0xff111111),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff51504f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f1f),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff484646),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     scaffoldBackgroundColor: colorScheme.surfaceBright,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
