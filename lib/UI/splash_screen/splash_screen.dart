import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Shub.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_cubit.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_state.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/socket/socket.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final _network = getIt.get<NetworkManager>();
final _localStorage = getIt.get<LocalStorage>();
final _notiSocket = getIt.get<NotificationSocket>();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final isLogin = context.read<SplashCubit>().state.isLogin;
    final isCompany = context.read<SplashCubit>().state.isCompany;
    final hasProfile = context.read<SplashCubit>().state.hasProfile;
    final idString = _localStorage.getString(key: StorageKey.userID);
    final id = idString != null ? int.parse(idString) : -1;
    if (isLogin == false) {
      context.router.replace(const MyAppRoute());
    } else {
      _notiSocket.listenInBackground();
      if (isCompany == true && hasProfile == true)
        context.router.replace(const CompanyDashboardWrapperRoute());
      else if (isCompany == false && hasProfile == true)
        context.router.replace(const ProjectListWrapperRoute());
      else
        context.router.replace(const SwitchAccountPageRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
    );
  }
}