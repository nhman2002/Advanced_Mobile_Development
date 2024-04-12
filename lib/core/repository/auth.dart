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

  Future<Auth> login(String email, String password) async {
    final response = await post<Auth>(
      path: '/login',
      parseJsonFunction: Auth.fromJson,
      data: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }

  Future<Auth> register(String email, String password) async {
    final response = await post<Auth>(
      path: '/register',
      parseJsonFunction: Auth.fromJson,
      data: {
        'email': email,
        'password': password,
        'source': 'https://www.google.com/'
      },
    );
    return response;
  }

}