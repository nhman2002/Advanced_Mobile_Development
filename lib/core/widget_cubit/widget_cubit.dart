import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/common/config/navigation_event.dart';
import 'package:student_hub/core/base_widget/cubit/navigation_bloc.dart';
import 'package:student_hub/core/logger/logger.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';
import 'package:student_hub/common/config/loading_event.dart';

typedef ParseJsonFunction<T> = T Function(Map<String, dynamic> jsonData);

// typedef ApiCallerFunction<OutputType> = Future<OutputType?>? Function();

abstract class WidgetCubit<State extends WidgetState> extends Cubit<State> {
  WidgetCubit({required State initialState, required this.parseJsonFunction})
      : super(initialState);

  ParseJsonFunction parseJsonFunction;
  Object? _args;

  Object? get args => _args;

  set args(Object? value) {
    _args = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  Future<void> init();

  Future<void> onApiError(Object e) async {}

  final _loadingController = StreamController<LoadingEvent>.broadcast();

  Stream<LoadingEvent> get loadingStream =>
      _loadingController.stream.distinct();

  void showLoading({String? message}) {
    _loadingController.add(LoadingEvent(isLoading: true, message: message));
  }

  void hideLoading() {
    if (!isClosed) {
      _loadingController.add(const LoadingEvent(isLoading: false));
    }
  }

  NavigationBloc? navigationController;

  // Future<T?> getData<T>(
  //   ApiCallerFunction apiCallerFunction, {
  //   bool showErrorToast = true,
  //   bool showLoading = false,
  // }) async {
  //   if (showLoading) {
  //     this.showLoading();
  //   }
  //   return fetchApi(apiCallerFunction, showErrorToast: showErrorToast);
  // }
  //
  // Future<T?> submitData<T>(ApiCallerFunction? apiCallerFunction,
  //     {String? loadingMessage = 'Vui lòng chờ....',
  //     bool showErrorToast = true}) async {
  //   showLoading(message: loadingMessage);
  //   return fetchApi(apiCallerFunction, showErrorToast: showErrorToast);
  // }
  //
  // //port to listen error in background isolate
  //
  // Future<T?> fetchApi<T>(
  //     ApiCallerFunction? apiCallerFunction,
  //     {bool showErrorToast = true}) async {
  //   try {
  //     final output = (await apiCallerFunction?.call()) as T?;
  //     hideLoading();
  //
  //     return output;
  //   } catch (e) {
  //     logger.e(e.toString());
  //     hideLoading();
  //     if (e is DioException) {
  //       showSnackBar('Hệ thống đang lỗi. Vui lòng thử lại sau');
  //     } else {
  //       showSnackBar('Vui lòng thử lại');
  //     }
  //     onApiError(e);
  //     return Future.value();
  //   }
  // }

  void showSnackBarError(String message,
      {SnackBarType snackBarType = SnackBarType.error}) {
    navigationController?.add(ShowSnackBarErrorEvent(message, type: snackBarType));
  }

  @override
  Future<void> close() async {
    await _loadingController.close();

    stream.drain();

    super.close();
  }

  @override
  State? fromJson(Map<String, dynamic> json) {
    try {
      return parseJsonFunction(json) as State;
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(State state) {
    return state.toJson();
  }

  // function to control navigation

  void pushRoute(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    navigationController
        ?.add(PushRouteEvent(route, onNavigationFailure: onFailure));
  }

  void replaceRoute(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    navigationController
        ?.add(ReplaceRouteEvent(route, onNavigationFailure: onFailure));
  }

  void popRoute<T extends Object?>([T? result]) {
    navigationController?.add(PopEvent(result: result));
  }

  void replaceAll(List<PageRouteInfo> routes) {
    navigationController?.add(ReplaceAllEvent(routes));
  }

  void popUntil(RoutePredicate predicate) {
    navigationController?.add(PopUntilEvent(predicate: predicate));
  }

  void popUntilRouteWithName(String name) {
    navigationController?.add(PopUntilWithNameEvent(name));
  }

  void navigateTo(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    navigationController?.add(NavigateToEvent(route, onFailure: onFailure));
  }

  void navigateNamedTo(String path,
      {bool includePrefixMatches = false, OnNavigationFailure? onFailure}) {
    navigationController?.add(NavigateNamedToEvent(path,
        includePrefixMatches: includePrefixMatches, onFailure: onFailure));
  }

  void removeWhere(RouteDataPredicate predicate, {bool notify = true}) {
    navigationController?.add(RemoveWhereEvent(predicate, notify: notify));
  }
}
