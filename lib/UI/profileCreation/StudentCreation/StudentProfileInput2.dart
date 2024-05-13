import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_cubit.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_state.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/widget/pop_up_language_edit_widget.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/widget/pop_up_languages_widget.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/widget/show-language_widget.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/widget/pop_up_education_widget.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/widget/show_school_widget.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class StudentProfileInputExperience extends StatefulWidget {
  const StudentProfileInputExperience({Key? key}) : super(key: key);

  @override
  State<StudentProfileInputExperience> createState() =>
      _StudentProfileInputExperienceState();
}

class _StudentProfileInputExperienceState
    extends State<StudentProfileInputExperience> {
  String? selectedTechStackID;
  List<String> selectedSkills = [];
  List<Language> languages = [];
  List<EducationInput> educationList = [];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileInputCubit, StudentProfileInputState>(
        builder: (context, state) {
      final techStackList = state.techStackList;
      final skillSetList = state.skillSetList;

      return Scaffold(
      );
        }
    );
  }
}