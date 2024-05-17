import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/repository/base.dart';

class UserRepository extends BaseRepository{
  UserRepository() : super('/user');



  Future<DataState> forgotPassword(String email) async {
    return post(
      path: '/forgotPassword',
      parseJsonFunction: LoginOutput.fromJson,
      data: {
        "email": email,
      }
    );
  }


  Future<DataState> changePassword(String oldPassword, String newPassword) async {
    return put(
      path: '/changePassword',
      parseJsonFunction: LoginOutput.fromJson,
      data: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }
    );
  }

}

