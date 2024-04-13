class AuthForm {
  final String? email;
  final String? password;

  AuthForm({this.email, this.password});

  factory AuthForm.fromJson(Map<String, dynamic> json) {
    return AuthForm(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  AuthForm copyWith({
    String? email,
    String? password,
  }) =>
      AuthForm(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}