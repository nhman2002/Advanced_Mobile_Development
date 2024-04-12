import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/common/config/navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationEvent> {
  NavigationBloc() : super(NavigationEvent()) {
    on<NavigationEvent>((event, emit) {
      emit(event);
    });
  }
}