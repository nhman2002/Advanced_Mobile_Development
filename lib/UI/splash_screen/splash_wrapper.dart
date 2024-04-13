import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_cubit.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_state.dart';

@RoutePage()
class SplashWrapper extends BaseWidget<SplashCubit, SplashState> {
  const SplashWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider(
        create: (context) => SplashCubit()..init(), child: const AutoRouter());
  }

  @override
  SplashCubit? provideCubit(BuildContext context) {
    // TODO: implement provideCubit
    return null;
  }
}