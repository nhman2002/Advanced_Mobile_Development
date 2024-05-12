import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4286856366),
      surfaceTint: Color(4286856366),
      onPrimary: Color.fromARGB(255, 224, 144, 240),
      primaryContainer: Color(4292581631),
      onPrimaryContainer: Color(4282450018),
      secondary: Color(4285617024),
      onSecondary: Color.fromARGB(255, 243, 154, 255),
      secondaryContainer: Color(4294103551),
      onSecondaryContainer: Color(4283775332),
      tertiary: Color(4288886874),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294939053),
      onTertiaryContainer: Color(4283695139),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965244),
      onBackground: Color(4280228385),
      surface: Color(4294965244),
      onSurface: Color(4280228385),
      surfaceVariant: Color(4293779183),
      onSurfaceVariant: Color(4283253585),
      outline: Color(4286542722),
      outlineVariant: Color(4291871442),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281609782),
      inverseOnSurface: Color(4294569464),
      inversePrimary: Color(4293309695),
      primaryFixed: Color(4294302207),
      onPrimaryFixed: Color(4281335882),
      primaryFixedDim: Color(4293309695),
      onPrimaryFixedVariant: Color(4285145236),
      secondaryFixed: Color(4294302207),
      onSecondaryFixed: Color(4280946488),
      secondaryFixedDim: Color(4292786925),
      onSecondaryFixedVariant: Color(4283972711),
      tertiaryFixed: Color(4294957536),
      onTertiaryFixed: Color(4282318873),
      tertiaryFixedDim: Color(4294947267),
      onTertiaryFixedVariant: Color(4286783298),
      surfaceDim: Color(4292990945),
      surfaceBright: Color(4294965244),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294766843),
      surfaceContainer: Color(4294372341),
      surfaceContainerHigh: Color(4293977583),
      surfaceContainerHighest: Color(4293582826),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4284881551),
      surfaceTint: Color(4286856366),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288500934),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283709539),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287130007),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4286454335),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290727536),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294965244),
      onBackground: Color(4280228385),
      surface: Color(4294965244),
      onSurface: Color(4280228385),
      surfaceVariant: Color(4293779183),
      onSurfaceVariant: Color(4282990413),
      outline: Color(4284898154),
      outlineVariant: Color(4286805894),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281609782),
      inverseOnSurface: Color(4294569464),
      inversePrimary: Color(4293309695),
      primaryFixed: Color(4288500934),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286724779),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287130007),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285419901),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4290727536),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4288623959),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292990945),
      surfaceBright: Color(4294965244),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294766843),
      surfaceContainer: Color(4294372341),
      surfaceContainerHigh: Color(4293977583),
      surfaceContainerHighest: Color(4293582826),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281991256),
      surfaceTint: Color(4286856366),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284881551),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281407296),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283709539),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283105311),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286454335),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294965244),
      onBackground: Color(4280228385),
      surface: Color(4294965244),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293779183),
      onSurfaceVariant: Color(4280885549),
      outline: Color(4282990413),
      outlineVariant: Color(4282990413),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281609782),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294632959),
      primaryFixed: Color(4284881551),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283039854),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283709539),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282130763),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286454335),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284416041),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292990945),
      surfaceBright: Color(4294965244),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294766843),
      surfaceContainer: Color(4294372341),
      surfaceContainerHigh: Color(4293977583),
      surfaceContainerHighest: Color(4293582826),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293507839),
      surfaceTint: Color(4293309695),
      onPrimary: Color(4283367542),
      primaryContainer: Color(4291724280),
      onPrimaryContainer: Color(4280877119),
      secondary: Color(4292786925),
      onSecondary: Color(4282393935),
      secondaryContainer: Color(4283512159),
      onSecondaryContainer: Color(4293773565),
      tertiary: Color(4294949064),
      onTertiary: Color(4284809772),
      tertiaryContainer: Color(4294474397),
      onTertiaryContainer: Color(4281794581),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279702041),
      onBackground: Color(4293582826),
      surface: Color(4279702041),
      onSurface: Color(4293582826),
      surfaceVariant: Color(4283253585),
      onSurfaceVariant: Color(4291871442),
      outline: Color(4288253340),
      outlineVariant: Color(4283253585),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293582826),
      inverseOnSurface: Color(4281609782),
      inversePrimary: Color(4286856366),
      primaryFixed: Color(4294302207),
      onPrimaryFixed: Color(4281335882),
      primaryFixedDim: Color(4293309695),
      onPrimaryFixedVariant: Color(4285145236),
      secondaryFixed: Color(4294302207),
      onSecondaryFixed: Color(4280946488),
      secondaryFixedDim: Color(4292786925),
      onSecondaryFixedVariant: Color(4283972711),
      tertiaryFixed: Color(4294957536),
      onTertiaryFixed: Color(4282318873),
      tertiaryFixedDim: Color(4294947267),
      onTertiaryFixedVariant: Color(4286783298),
      surfaceDim: Color(4279702041),
      surfaceBright: Color(4282201919),
      surfaceContainerLowest: Color(4279307283),
      surfaceContainerLow: Color(4280228385),
      surfaceContainer: Color(4280491557),
      surfaceContainerHigh: Color(4281215024),
      surfaceContainerHighest: Color(4281938747),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293507839),
      surfaceTint: Color(4293309695),
      onPrimary: Color(4280811583),
      primaryContainer: Color(4291724280),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293050098),
      onSecondary: Color(4280551731),
      secondaryContainer: Color(4289103285),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949064),
      onTertiary: Color(4281794581),
      tertiaryContainer: Color(4294474397),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279702041),
      onBackground: Color(4293582826),
      surface: Color(4279702041),
      onSurface: Color(4294965755),
      surfaceVariant: Color(4283253585),
      onSurfaceVariant: Color(4292200151),
      outline: Color(4289503150),
      outlineVariant: Color(4287332238),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293582826),
      inverseOnSurface: Color(4281215024),
      inversePrimary: Color(4285276821),
      primaryFixed: Color(4294302207),
      onPrimaryFixed: Color(4280352820),
      primaryFixedDim: Color(4293309695),
      onPrimaryFixedVariant: Color(4283957890),
      secondaryFixed: Color(4294302207),
      onSecondaryFixed: Color(4280157229),
      secondaryFixedDim: Color(4292786925),
      onSecondaryFixedVariant: Color(4282788693),
      tertiaryFixed: Color(4294957536),
      onTertiaryFixed: Color(4281073679),
      tertiaryFixedDim: Color(4294947267),
      onTertiaryFixedVariant: Color(4285336114),
      surfaceDim: Color(4279702041),
      surfaceBright: Color(4282201919),
      surfaceContainerLowest: Color(4279307283),
      surfaceContainerLow: Color(4280228385),
      surfaceContainer: Color(4280491557),
      surfaceContainerHigh: Color(4281215024),
      surfaceContainerHighest: Color(4281938747),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294965755),
      surfaceTint: Color(4293309695),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4293507839),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965755),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293050098),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294948807),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279702041),
      onBackground: Color(4293582826),
      surface: Color(4279702041),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4283253585),
      onSurfaceVariant: Color(4294965755),
      outline: Color(4292200151),
      outlineVariant: Color(4292200151),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293582826),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4282777705),
      primaryFixed: Color(4294434815),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4293507839),
      onPrimaryFixedVariant: Color(4280811583),
      secondaryFixed: Color(4294434815),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293050098),
      onSecondaryFixedVariant: Color(4280551731),
      tertiaryFixed: Color(4294959076),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294948807),
      onTertiaryFixedVariant: Color(4281663508),
      surfaceDim: Color(4279702041),
      surfaceBright: Color(4282201919),
      surfaceContainerLowest: Color(4279307283),
      surfaceContainerLow: Color(4280228385),
      surfaceContainer: Color(4280491557),
      surfaceContainerHigh: Color(4281215024),
      surfaceContainerHighest: Color(4281938747),
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
