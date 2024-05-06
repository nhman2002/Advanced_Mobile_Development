import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationEvent {}

class PushEvent extends NavigationEvent {
  final PageRouteInfo route;
  final OnNavigationFailure? onNavigationFailure;

  PushEvent(this.route, {this.onNavigationFailure});
}

class PushRouteEvent extends PushEvent {
  PushRouteEvent(super.route, {super.onNavigationFailure});
}

class ReplaceRouteEvent extends PushEvent {
  ReplaceRouteEvent(super.route, {super.onNavigationFailure});
}

class PopEvent<T extends Object?> extends NavigationEvent {
  T? result;
  PopEvent({this.result});
}

class PopUntilEvent extends NavigationEvent {
  final RoutePredicate predicate;

  PopUntilEvent({required this.predicate});
}

class PopUntilWithNameEvent extends NavigationEvent {
  final String name;

  PopUntilWithNameEvent(this.name);
}

class RemoveWhereEvent extends NavigationEvent {
  RouteDataPredicate predicate;
  bool notify;
  RemoveWhereEvent(this.predicate, {this.notify = true});
}

class NavigateToEvent extends NavigationEvent {
  final PageRouteInfo route;
  final OnNavigationFailure? onFailure;

  NavigateToEvent(this.route, {this.onFailure});
}

class BackEvent extends NavigationEvent {}

class ReplaceAllEvent extends NavigationEvent {
  final List<PageRouteInfo> routes;

  ReplaceAllEvent(this.routes);
}

class LogoutEvent extends NavigationEvent {}

class ApiErrorEvent extends NavigationEvent {
  String message;

  ApiErrorEvent(this.message);
}

class NavigateNamedToEvent extends NavigationEvent {
  final String path;
  final bool includePrefixMatches;
  final OnNavigationFailure? onFailure;

  NavigateNamedToEvent(this.path,
      {this.includePrefixMatches = false, this.onFailure});
}

class ShowBottomSheetEven extends NavigationEvent {
  Widget bottomSheet;

  ShowBottomSheetEven(this.bottomSheet);
}

class ShowDialogEvent extends NavigationEvent {
  Widget dialog;

  ShowDialogEvent(this.dialog);
}

class ShowToastEvent extends NavigationEvent {
  String message;

  ShowToastEvent(this.message);
}

class ShowSnackBarErrorEvent extends NavigationEvent {
  String message;
  SnackBarType type;
  ShowSnackBarErrorEvent(this.message, {this.type = SnackBarType.error});
}

class ShowSnackBarSuccessEvent extends NavigationEvent {
  String message;
  SnackBarType type;
  ShowSnackBarSuccessEvent(this.message, {this.type = SnackBarType.success});
}

class ShowSnackBarWarningEvent extends NavigationEvent {
  String message;
  SnackBarType type;
  ShowSnackBarWarningEvent(this.message, {this.type = SnackBarType.warning});
}

class ShowNotificationEvent extends NavigationEvent {
  String message;
  String title;
  ShowNotificationEvent(this.message, this.title);
}


enum SnackBarType { error, success, warning, info }
