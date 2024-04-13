import 'package:dio/dio.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/repository/base.dart';

class UserRepository extends BaseRepository{
  UserRepository() : super('/user');

  }

