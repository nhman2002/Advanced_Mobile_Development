// import 'package:lettutor/core/data_source/network/data_state.dart';
// import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
// import 'package:lettutor/core/data_source/network/models/input/update_password_form.dart';
// import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
// import 'package:lettutor/core/repository/base_repository.dart';

import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/auth_model.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/repository/base.dart';


class AuthRepository extends BaseRepository {
  AuthRepository() : super('/auth');

  Future<DataState<AuthOutput>> login(AuthForm input) async {
    return post<AuthOutput>(
      path: '/sign-in',
      parseJsonFunction: AuthOutput.fromJson,
      data: input.toJson(),
    );
  }


  // Future<DataState<AuthOutput>> register(AuthForm input) async {
  //   return post<AuthOutput>(
  //     path: '/sign-up',
  //     parseJsonFunction: AuthOutput.fromJson,
  //     data: {
  //       'email': input.email,
  //       'password': input.password,
  //       'fullname': input.name,
  //       'role': input.role
  //     },
  //   );
  //   return response;
  // }

}