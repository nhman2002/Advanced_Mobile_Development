import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/routes.dart';
import 'package:student_hub/common/storage/local_storage.dart';

final getIt = GetIt.instance;


bool isInit = false;

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!isInit) {
    final localStorage = await LocalStorage.init();
    getIt.registerSingleton<LocalStorage>(localStorage);
  }

  if (isInit) {
    return;
  }
  isInit = true;

}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MainApp extends StatelessWidget {
  // This widget is the root of this application.

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Student hub',
          routes: Routes.routes,
          home:  HomeScreen() 
        );
      },
    );
  }
}
