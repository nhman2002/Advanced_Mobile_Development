import 'package:student_hub/core/base_widget/cubit/empty_state.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';

class EmptyCubit extends WidgetCubit {
  EmptyCubit()
      : super(
            initialState: const EmptyState(),
            parseJsonFunction: (json) => const EmptyState());

  @override
  Future<void> init() async {}
}
