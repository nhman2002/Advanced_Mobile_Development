class RegisterForm {
  final String? email;
  final String? password;
  final String? fullname;
  final int? role;

  RegisterForm({this.email, this.password, this.fullname, this.role});

  factory RegisterForm.fromJson(Map<String, dynamic> json) {
    return RegisterForm(
      email: json['email'] as String?,
      password: json['password'] as String?,
      fullname: json['fullname'] as String?,
      role: json['role'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['fullname'] = fullname;
    map['role'] = role;
    return map;
  }

  RegisterForm copyWith({
    String? email,
    String? password,
    String? fullname,
    int? role,
  }) =>
      RegisterForm(
        email: email ?? this.email,
        password: password ?? this.password,
        fullname: fullname ?? this.fullname,
        role: role ?? this.role,
      );
}