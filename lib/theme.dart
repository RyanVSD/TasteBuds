import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFFBC02D),
      surfaceTint: Color(0xff6c5e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffe346),
      onPrimaryContainer: Color(0xff746400),
      secondary: Color(0xffffe346),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffe346),
      onSecondaryContainer: Color(0xff746400),
      tertiary: Color(0xFFFFFFFF),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFF0F0F0),
      onTertiaryContainer: Color(0xff6f7070),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xffFFFFFF),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffe346),
      primaryFixed: Color(0xffffe346),
      onPrimaryFixed: Color(0xff211b00),
      primaryFixedDim: Color(0xFFFBC02D),
      onPrimaryFixedVariant: Color(0xff524700),
      secondaryFixed: Color(0xffffe346),
      onSecondaryFixed: Color(0xff211b00),
      secondaryFixedDim: Color(0xffe1c628),
      onSecondaryFixedVariant: Color(0xff524700),
      tertiaryFixed: Color(0xffe2e2e2),
      onTertiaryFixed: Color(0xff1a1c1c),
      tertiaryFixedDim: Color(0xffc6c6c7),
      onTertiaryFixedVariant: Color(0xff454747),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }


  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffe1c628),
      onPrimary: Color(0xff383000),
      primaryContainer: Color(0xffffe346),
      onPrimaryContainer: Color(0xff746400),
      secondary: Color(0xFFFBC02D),
      onSecondary: Color(0xff383000),
      secondaryContainer: Color(0xffffe346),
      onSecondaryContainer: Color(0xff746400),
      tertiary: Color(0xff2f3131),
      onTertiary: Color(0xff2f3131),
      tertiaryContainer: Color(0xff2f3131),
      onTertiaryContainer: Color(0xff636565),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c8),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff6c5e00),
      primaryFixed: Color(0xffffe346),
      onPrimaryFixed: Color(0xff211b00),
      primaryFixedDim: Color(0xFFFBC02D),
      onPrimaryFixedVariant: Color(0xff524700),
      secondaryFixed: Color(0xffffe346),
      onSecondaryFixed: Color(0xff211b00),
      secondaryFixedDim: Color(0xffe1c628),
      onSecondaryFixedVariant: Color(0xff524700),
      tertiaryFixed: Color(0xffe2e2e2),
      onTertiaryFixed: Color(0xff1a1c1c),
      tertiaryFixedDim: Color(0xffc6c6c7),
      onTertiaryFixedVariant: Color(0xff454747),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
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
