import 'package:student_hub/core/widget_cubit/widget_state.dart';

class AccountSwitchState extends WidgetState {
  final bool? isLogin;
  final int? currentRole;
  final List<int>? userRoles;
  final bool? hasMultipleRoles; 
  final bool? hasStudentProfile;
  final bool? hasCompanyProfile;
  final String? userName;
  final String? companyName;
  const AccountSwitchState({
    this.isLogin,
    this.currentRole,
    this.userRoles,
    this.hasMultipleRoles,
    this.hasStudentProfile,
    this.hasCompanyProfile,
    this.userName,
    this.companyName,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLogin,
    currentRole,
    userRoles,
    hasMultipleRoles,
    hasCompanyProfile,
    hasStudentProfile,
    userName,
    companyName,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory AccountSwitchState.fromJson(Map<String, dynamic> json) {
    return AccountSwitchState(
      isLogin: json['isLogin'] as bool?,
      currentRole: json['currentRole'] as int?,
      userRoles: json['userRoles'] as List<int>?,
      hasMultipleRoles: json['hasMultipleRoles'] as bool?,
      hasCompanyProfile: json['hasCompanyProfile'] as bool?,
      hasStudentProfile: json['hasStudentProfiles'] as bool?,
      userName: json['currentName'] as String?,
      companyName: json['companyName'] as String?,

    );
  }

  AccountSwitchState copyWith({
    bool? isLogin,
    int? currentRole,
    List<int>? userRoles,
    bool? hasMultipleRoles,
    bool? hasCompanyProfile,
    bool? hasStudentProfile,
    String? userName,
    String? companyName,
  }) {
    return AccountSwitchState(
      isLogin: isLogin ?? this.isLogin,
      currentRole: currentRole ?? this.currentRole,    
      userRoles: userRoles ?? this.userRoles,  
      hasMultipleRoles: hasMultipleRoles ?? this.hasMultipleRoles,
      hasCompanyProfile: hasCompanyProfile ?? this.hasCompanyProfile,
      hasStudentProfile: hasStudentProfile ?? this.hasStudentProfile,
      userName: userName ?? this.userName,
      companyName: companyName ?? this.companyName,
    );
  }
}