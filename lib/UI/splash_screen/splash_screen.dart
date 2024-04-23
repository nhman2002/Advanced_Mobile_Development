import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Shub.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_cubit.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_state.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final isLogin = context.read<SplashCubit>().state.isLogin;
    final isCompany = context.read<SplashCubit>().state.isCompany;
    if (isLogin == false) {
      context.router.replace(const MyAppRoute());
    } else {
      if (isCompany == true)
        context.router.replace(const CompanyDashboardRoute());
      else
        context.router.replace(const ProjectListWrapperRoute());
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