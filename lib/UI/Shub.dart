import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/theme/bloc/theme.dart';
import 'package:student_hub/common/ui/theme/bloc/theme_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final router = AppRouter(navigatorKey: navigatorKey);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          final brightness = View.of(context).platformDispatcher.platformBrightness;

          TextTheme textTheme = createTextTheme(context, "Roboto", "Montserrat");

          MaterialTheme theme = MaterialTheme(textTheme); 
          return MaterialApp.router(
            title: 'Student Hub',
            theme: brightness == Brightness.light ? theme.lightHighContrast() : theme.dark(),
            themeMode: state,
            darkTheme: theme.darkHighContrast(),
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
          );
        },
      ),
    );
  }
}




TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}