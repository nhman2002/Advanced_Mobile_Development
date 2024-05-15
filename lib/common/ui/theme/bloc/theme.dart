import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282264511),
      surfaceTint: Color(4283779030),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284700388),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284242066),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291479039),
      onSecondaryContainer: Color(4281741930),
      tertiary: Color(4286646911),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289543335),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294768895),
      onBackground: Color(4279966499),
      surface: Color(4294768895),
      onSurface: Color(4279966499),
      surfaceVariant: Color(4293189875),
      onSurfaceVariant: Color(4282860884),
      outline: Color(4286084486),
      outlineVariant: Color(4291347671),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413432),
      inverseOnSurface: Color(4294176763),
      inversePrimary: Color(4291150079),
      primaryFixed: Color(4293124095),
      onPrimaryFixed: Color(4279500903),
      primaryFixedDim: Color(4291150079),
      onPrimaryFixedVariant: Color(4282132925),
      secondaryFixed: Color(4293124095),
      onSecondaryFixed: Color(4279767627),
      secondaryFixedDim: Color(4291150079),
      onSecondaryFixedVariant: Color(4282663033),
      tertiaryFixed: Color(4294957045),
      onTertiaryFixed: Color(4281860151),
      tertiaryFixedDim: Color(4294945778),
      onTertiaryFixedVariant: Color(4286580606),
      surfaceDim: Color(4292663524),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374142),
      surfaceContainer: Color(4293979384),
      surfaceContainerHigh: Color(4293584627),
      surfaceContainerHighest: Color(4293255661),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281869242),
      surfaceTint: Color(4283779030),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284700388),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282399860),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285689514),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4286251129),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289543335),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294768895),
      onBackground: Color(4279966499),
      surface: Color(4294768895),
      onSurface: Color(4279966499),
      surfaceVariant: Color(4293189875),
      onSurfaceVariant: Color(4282597712),
      outline: Color(4284439917),
      outlineVariant: Color(4286282122),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413432),
      inverseOnSurface: Color(4294176763),
      inversePrimary: Color(4291150079),
      primaryFixed: Color(4285292525),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283647187),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285689514),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284044687),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4290201265),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4288293270),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663524),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374142),
      surfaceContainer: Color(4293979384),
      surfaceContainerHigh: Color(4293584627),
      surfaceContainerHighest: Color(4293255661),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279828602),
      surfaceTint: Color(4283779030),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281869242),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280228433),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282399860),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282581059),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286251129),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294768895),
      onBackground: Color(4279966499),
      surface: Color(4294768895),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293189875),
      onSurfaceVariant: Color(4280558128),
      outline: Color(4282597712),
      outlineVariant: Color(4282597712),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413432),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293847551),
      primaryFixed: Color(4281869242),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280418455),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282399860),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280886620),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286251129),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283760724),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663524),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374142),
      surfaceContainer: Color(4293979384),
      surfaceContainerHigh: Color(4293584627),
      surfaceContainerHighest: Color(4293255661),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291150079),
      surfaceTint: Color(4291150079),
      onPrimary: Color(4280615074),
      primaryContainer: Color(4284107994),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4291150079),
      onSecondary: Color(4281149792),
      secondaryContainer: Color(4282005102),
      onSecondaryContainer: Color(4291939583),
      tertiary: Color(4294945778),
      onTertiary: Color(4284153946),
      tertiaryContainer: Color(4288885662),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279439899),
      onBackground: Color(4293255661),
      surface: Color(4279439899),
      onSurface: Color(4293255661),
      surfaceVariant: Color(4282860884),
      onSurfaceVariant: Color(4291347671),
      outline: Color(4287795104),
      outlineVariant: Color(4282860884),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255661),
      inverseOnSurface: Color(4281413432),
      inversePrimary: Color(4283779030),
      primaryFixed: Color(4293124095),
      onPrimaryFixed: Color(4279500903),
      primaryFixedDim: Color(4291150079),
      onPrimaryFixedVariant: Color(4282132925),
      secondaryFixed: Color(4293124095),
      onSecondaryFixed: Color(4279767627),
      secondaryFixedDim: Color(4291150079),
      onSecondaryFixedVariant: Color(4282663033),
      tertiaryFixed: Color(4294957045),
      onTertiaryFixed: Color(4281860151),
      tertiaryFixedDim: Color(4294945778),
      onTertiaryFixedVariant: Color(4286580606),
      surfaceDim: Color(4279439899),
      surfaceBright: Color(4281940033),
      surfaceContainerLowest: Color(4279110933),
      surfaceContainerLow: Color(4279966499),
      surfaceContainer: Color(4280295207),
      surfaceContainerHigh: Color(4280953138),
      surfaceContainerHighest: Color(4281676861),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291478783),
      surfaceTint: Color(4291150079),
      onPrimary: Color(4279238744),
      primaryContainer: Color(4287267071),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291478783),
      onSecondary: Color(4279372613),
      secondaryContainer: Color(4287597256),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294947570),
      onTertiary: Color(4281270319),
      tertiaryContainer: Color(4292436943),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279439899),
      onBackground: Color(4293255661),
      surface: Color(4279439899),
      onSurface: Color(4294900223),
      surfaceVariant: Color(4282860884),
      onSurfaceVariant: Color(4291610843),
      outline: Color(4288979379),
      outlineVariant: Color(4286874002),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255661),
      inverseOnSurface: Color(4280953138),
      inversePrimary: Color(4282264511),
      primaryFixed: Color(4293124095),
      onPrimaryFixed: Color(4278911050),
      primaryFixedDim: Color(4291150079),
      onPrimaryFixedVariant: Color(4280944558),
      secondaryFixed: Color(4293124095),
      onSecondaryFixed: Color(4279043393),
      secondaryFixedDim: Color(4291150079),
      onSecondaryFixedVariant: Color(4281544551),
      tertiaryFixed: Color(4294957045),
      onTertiaryFixed: Color(4280746022),
      tertiaryFixedDim: Color(4294945778),
      onTertiaryFixedVariant: Color(4284809316),
      surfaceDim: Color(4279439899),
      surfaceBright: Color(4281940033),
      surfaceContainerLowest: Color(4279110933),
      surfaceContainerLow: Color(4279966499),
      surfaceContainer: Color(4280295207),
      surfaceContainerHigh: Color(4280953138),
      surfaceContainerHighest: Color(4281676861),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294900223),
      surfaceTint: Color(4291150079),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291478783),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294900223),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291478783),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294947570),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279439899),
      onBackground: Color(4293255661),
      surface: Color(4279439899),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282860884),
      onSurfaceVariant: Color(4294900223),
      outline: Color(4291610843),
      outlineVariant: Color(4291610843),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255661),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4280287376),
      primaryFixed: Color(4293453055),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291478783),
      onPrimaryFixedVariant: Color(4279238744),
      secondaryFixed: Color(4293453055),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291478783),
      onSecondaryFixedVariant: Color(4279372613),
      tertiaryFixed: Color(4294958581),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294947570),
      onTertiaryFixedVariant: Color(4281270319),
      surfaceDim: Color(4279439899),
      surfaceBright: Color(4281940033),
      surfaceContainerLowest: Color(4279110933),
      surfaceContainerLow: Color(4279966499),
      surfaceContainer: Color(4280295207),
      surfaceContainerHigh: Color(4280953138),
      surfaceContainerHighest: Color(4281676861),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
