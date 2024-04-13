import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class StudentRegisterState extends WidgetState {
  final bool isRegister;
  final String? message;
  final User? user;

  const StudentRegisterState({
    this.isRegister = false,
    this.message,
    this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        isRegister,
        message,
        user,
      ];

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return {
      'isRegister': isRegister,
      'message': message,
      'user': user?.toJson(),
    };
  }

  factory StudentRegisterState.fromJson(Map<String, dynamic> json) {
    return StudentRegisterState(
      isRegister: json['isRegister'] as bool,
      message: json['message'] as String?,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  StudentRegisterState copyWith({
    bool? isRegister,
    String? message,
    User? user,
  }) {
    return StudentRegisterState(
      isRegister: isRegister ?? this.isRegister,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
