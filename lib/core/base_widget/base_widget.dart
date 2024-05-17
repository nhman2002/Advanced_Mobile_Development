import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/common/config/navigation_event.dart';
import 'package:student_hub/common/config/colors.dart';
import 'package:student_hub/core/base_widget/cubit/empty_cubit.dart';
import 'package:student_hub/core/base_widget/cubit/navigation_bloc.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

abstract class BaseWidget<Cubit extends WidgetCubit<State>,
    State extends WidgetState> extends StatelessWidget {
  const BaseWidget({super.key});

  Cubit? provideCubit(BuildContext context);

  Widget buildWidget(BuildContext context);

  bool isLazyCubit() => true;

  void onNavigation(BuildContext context, NavigationEvent? event) {}

  Widget buildLoadingWidget(BuildContext context, String? message) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  // if you want to use unique bloc for each screen, override this function and return true
  bool get isUniqueBloc => false;

  void onBack(BuildContext context, Object? result) {}
  Future<bool> onWillPop(BuildContext context) async {
    return true;
  }

  //handle navigation

  void handleNavigation(BuildContext context, NavigationEvent? event) {
    if (event is PushRouteEvent) {
      context
          .pushRoute(event.route, onFailure: event.onNavigationFailure)
          .then((value) => onBack(context, value));
    } else if (event is ReplaceRouteEvent) {
      context.replaceRoute(event.route, onFailure: event.onNavigationFailure);
    } else if (event is PopEvent) {
      context.maybePop(event.result);
    } else if (event is PopUntilEvent) {
      context.router.popUntil(event.predicate);
    } else if (event is PopUntilWithNameEvent) {
      context.router.popUntilRouteWithName(event.name);
    } else if (event is NavigateToEvent) {
      context.navigateTo(event.route, onFailure: event.onFailure);
    } else if (event is BackEvent) {
      context.back();
    } else if (event is RemoveWhereEvent) {
      context.router.removeWhere(event.predicate, notify: event.notify);
    } else if (event is ReplaceAllEvent) {
      context.router.replaceAll(event.routes);
    } else if (event is ShowBottomSheetEven) {
      showBottomSheet(
          context: context,
          builder: (context) {
            return event.bottomSheet;
          });
    } else if (event is ApiErrorEvent) {
      showSnackBarError(context, event.message);
    } else if (event is ShowSnackBarWarningEvent) {
      showSnackBarWarning(context, event.message, type: event.type);
    }else if (event is ShowSnackBarSuccessEvent) {
      showSnackBarSuccess(context, event.message, type: event.type);
    }else if (event is ShowSnackBarErrorEvent) {
      showSnackBarError(context, event.message, type: event.type);
    } else if (event is ShowNotificationEvent) {
      
    } else {
      onNavigation(context, event);
    }
  }

  static void showNotification(BuildContext context, String title, String message) {
    
  }

  static void showSnackBarSuccess(BuildContext context, String message,
      {SnackBarType? type = SnackBarType.success}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            margin: const EdgeInsets.only(left: 12, right: 12, bottom: 36),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            content: Row(
              children: [
                type == SnackBarType.error
                    ? Icon(
                        Icons.warning,
                        color: HexColor.fromHex('#FA5304'),
                      )
                    : Icon(
                        Icons.check_circle,
                        color: HexColor.fromHex('#34A853'),
                      ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: type == SnackBarType.error
                            ? HexColor.fromHex('#FA5304')
                            : HexColor.fromHex('#34A853')),
                  ),
                ),
              ],
            ),
            backgroundColor: type == SnackBarType.error
                ? HexColor.fromHex('#FCE4D9').withOpacity(0.95)
                : HexColor.fromHex('#E7FBED')),
      );
    });
  }

  static void showSnackBarWarning(BuildContext context, String message,
      {SnackBarType? type = SnackBarType.warning}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            margin: const EdgeInsets.only(left: 12, right: 12, bottom: 36),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            content: Row(
              children: [
                type == SnackBarType.error
                    ? Icon(
                        Icons.warning,
                        color: HexColor.fromHex('#FA5304'),
                      )
                    : Icon(
                        Icons.check_circle,
                        color: HexColor.fromHex('#34A853'),
                      ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: type == SnackBarType.error
                            ? HexColor.fromHex('#FA5304')
                            : HexColor.fromHex('#34A853')),
                  ),
                ),
              ],
            ),
            backgroundColor: type == SnackBarType.error
                ? HexColor.fromHex('#FCE4D9').withOpacity(0.95)
                : HexColor.fromHex('#E7FBED')),
      );
    });
  }

  static void showSnackBarError(BuildContext context, String message,
      {SnackBarType? type = SnackBarType.error}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            margin: const EdgeInsets.only(left: 12, right: 12, bottom: 36),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            content: Row(
              children: [
                type == SnackBarType.error
                    ? Icon(
                        Icons.warning,
                        color: HexColor.fromHex('#FA5304'),
                      )
                    : Icon(
                        Icons.check_circle,
                        color: HexColor.fromHex('#34A853'),
                      ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: type == SnackBarType.error
                            ? HexColor.fromHex('#FA5304')
                            : HexColor.fromHex('#34A853')),
                  ),
                ),
              ],
            ),
            backgroundColor: type == SnackBarType.error
                ? HexColor.fromHex('#FCE4D9').withOpacity(0.95)
                : HexColor.fromHex('#E7FBED')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (provideCubit(context) == null) {
        return buildWidget(context);
      }
      return MultiBlocProvider(
        providers: [

          BlocProvider(
              key: isUniqueBloc && !kDebugMode ? UniqueKey() : null,
              create: (context) => NavigationBloc()),
          BlocProvider(
              key: isUniqueBloc && !kDebugMode ? UniqueKey() : null,
              create: (context) =>
                  (provideCubit(context) ?? EmptyCubit() as Cubit)
                    ..navigationController = context.read<NavigationBloc>()
                    ..args = context.routeData.args,
              lazy: isLazyCubit()),
        ],
        child: BlocListener<NavigationBloc, NavigationEvent>(
          listener: handleNavigation,
          listenWhen: (previous, current) {
            return previous != current;
          },
          child: WillPopScope(
              onWillPop: () {
                return onWillPop(context);
              },
              child: buildUi(context)),
        ),
      );
    });
  }

  Widget buildUi(BuildContext context) {
    return BlocBuilder<Cubit, State>(
      builder: (context, state) {
        return GestureDetector(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: buildWidget(context),
              ),
              StreamBuilder(
                  stream: context.read<Cubit>().loadingStream,
                  builder: (context, snapshot) {
                    // This is the key part of the code that will display the loading widget
                    if (snapshot.hasData) {
                      if (snapshot.data?.isLoading ?? false) {
                        return Positioned.fill(
                            child: Container(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          color: Colors.black.withOpacity(0.2),
                          child: Center(
                            child: buildLoadingWidget(
                                context, snapshot.data?.message),
                          ),
                        ));
                      }
                    }
                    return Container();
                  })
            ],
          ),
        );
      },
    );
  }
}
