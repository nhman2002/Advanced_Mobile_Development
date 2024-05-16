// import 'package:lettutor/core/data_source/network/data_state.dart';
// import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
// import 'package:lettutor/core/data_source/network/models/input/update_password_form.dart';
// import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
// import 'package:lettutor/core/repository/base_repository.dart';

import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/login_model.dart';
import 'package:student_hub/core/models/input/register_model.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/repository/base.dart';


class AuthRepository extends BaseRepository {
  AuthRepository() : super('/auth');

  Future<DataState<LoginOutput>> login(AuthForm input) async {
    return post<LoginOutput>(
      path: '/sign-in',
      parseJsonFunction: LoginOutput.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<LoginOutput>> register(RegisterForm input) async {
    return post<LoginOutput>(
      path: '/sign-up',
      parseJsonFunction: LoginOutput.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<User>> getUser() async {
    return get<User>(
      path: '/me',
      parseJsonFunction: User.fromJson,
    );
  }
}