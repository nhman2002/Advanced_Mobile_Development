import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/theme/bloc/theme.dart';
import 'package:student_hub/common/ui/theme/bloc/theme_bloc.dart';

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
          final theme = state == ThemeMode.light ? lightTheme ?? fallBackTheme : darkTheme ?? fallBackTheme;  //check fallBack
          return MaterialApp.router(
            title: 'Student Hub',
            theme: lightTheme,
            themeMode: state,
            darkTheme: darkTheme,
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
