import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/general.dart';
import 'package:student_hub/core/repository/profileStudent.dart';
import 'package:student_hub/core/repository/skillSet.dart';
import 'package:student_hub/core/repository/techStack.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';

class StudentProfileInputCubit extends WidgetCubit<StudentProfileInputState> {
  StudentProfileInputCubit()
      : super(
          initialState: const StudentProfileInputState(),
          parseJsonFunction: StudentProfileInputState.fromJson,
        );

  final _localStorage = getIt.get<LocalStorage>();
  final _techStack = getIt.get<TechStackRepository>();
  final _skillSet = getIt.get<SkillSetRepository>();
  final _studentProfile = getIt.get<StudentProfileRepository>();
  final _inputProfile = getIt.get<GeneralRepository>();
  final _auth = getIt.get<AuthRepository>();

  @override
  Future<void> init() async {
    showLoading();

    final userId =
        int.parse(_localStorage.getString(key: StorageKey.studentID) ?? '-1');
    // _requestPermission();
    final result = await _techStack.getAll();
    if (result is DataSuccess) {
      final techStack = result.data?.techStackList;
      emit(state.copyWith(techStackList: techStack));
    } else {
      emit(state.copyWith(techStackList: null));
    }

    final result2 = await _skillSet.getAll();
    if (result2 is DataSuccess) {
      final skillSet = result2.data?.skillSetList;
      emit(state.copyWith(skillSetList: skillSet));
    } else {
      emit(state.copyWith(skillSetList: null));
    }
    final res = await _studentProfile.getStudentProfile(userId);
    if (res is DataSuccess) {
      final studentProfile = res.data;
      emit(state.copyWith(studentProfile: studentProfile));
      final selectedTechStackId = studentProfile?.techStack?.id;
      emit(state.copyWith(selectedTechStackId: selectedTechStackId));
      final selectedSkillSetList =
          studentProfile?.skillSets?.map((e) => e.id.toString()).toList();
      emit(state.copyWith(selectedSkillSetList: selectedSkillSetList));
      final experience = studentProfile?.experiences;
      //convert experience into experienceInput
      List<ExperienceInput> experienceInput = experience!
          .map((e) => ExperienceInput().copyWith(
                startMonth: e.startMonth, endMonth: e.endMonth,
                //convert List<SkillSet> to List<String>
                skillSets: e.skillSets?.map((e) => e.id.toString()).toList(),
                description: e.description,
                title: e.title,
              ))
          .toList();
      ExperienceList inputExperienceList =
          ExperienceList().copyWith(experiences: experienceInput);
      emit(state.copyWith(experienceList: inputExperienceList));
      final languages = studentProfile?.languages;
      List<LanguageInput> languageInput = languages!
          .map((e) => LanguageInput().copyWith(
                languageName: e.languageName,
                level: e.level,
              ))
          .toList();
      LanguageList inputLanguagesList =
          LanguageList().copyWith(languages: languageInput);
      emit(state.copyWith(languagesList: inputLanguagesList));
      final education = studentProfile?.educations;
      List<EducationInput> educationInput = education!
          .map((e) => EducationInput().copyWith(
                schoolName: e.schoolName,
                startYear: e.startYear,
                endYear: e.endYear,
              ))
          .toList();
      EducationList inputEducationList =
          EducationList().copyWith(educations: educationInput);
      emit(state.copyWith(educationList: inputEducationList));

      emit(state.copyWith(
          cvPath: studentProfile?.resume,
          transcriptPath: studentProfile?.transcript));
      emit(state.copyWith(isEdit: true));
    } else {
      emit(state.copyWith(isEdit: false));
      emit(state.copyWith(studentProfile: null));
    }

    print('Student Profile: ${state.studentProfile}');
    hideLoading();
  }

  void setSelectedTechStackID(String? value) {
    emit(state.copyWith(selectedTechStackId: int.parse(value!)));
    debugPrint('Selected Tech Stack ID: $value');
  }

  void setSelectedSkillSet(List<String> values) {
    emit(state.copyWith(selectedSkillSetList: values));
    debugPrint('Selected Skill Set: $values');
  }

  void setCV(String cvPath) {
    emit(state.copyWith(cvPath: cvPath));
    debugPrint('CV Path: $cvPath');
  }

  void setTranscript(String transcriptFile) {
    emit(state.copyWith(transcriptPath: transcriptFile));
    debugPrint('Transcript Path: $transcriptFile');
  }

  void setExperience(List<ExperienceInput> experienceList) {
    ExperienceList inputExperienceList =
        ExperienceList().copyWith(experiences: experienceList);
    emit(state.copyWith(experienceList: inputExperienceList));
    debugPrint('Experience List: $experienceList');
  }

  void setLanguages(List<LanguageInput> languagesList) {
    LanguageList inputLanguagesList =
        LanguageList().copyWith(languages: languagesList);
    emit(state.copyWith(languagesList: inputLanguagesList));
    debugPrint('Languages List: $languagesList');
  }

  void setEducation(List<EducationInput> educationList) {
    EducationList inputEducationList =
        EducationList().copyWith(educations: educationList);
    emit(state.copyWith(educationList: inputEducationList));
    debugPrint('Education List: $educationList');
  }

  Future<void> uploadProfile(BuildContext context) async {
    showLoading();

    int studentID = int.parse(
        _localStorage.getString(key: StorageKey.studentID) ?? '-1');
    final techStackID = state.selectedTechStackId;
    final skillSetList = state.selectedSkillSetList;
    bool successFlag = true;
      String message = '';

    File cv = File(state.cvPath!);
    if (state.isEdit == false) {
      final form = TechStackForm()
          .copyWith(techStackId: techStackID, skillSets: skillSetList);
      // final experience = ExperienceInput().copyWith();
      final result = await _studentProfile.inputStudentProfile(form);

      if (result is DataSuccess) {
        studentID = result.data!.id ?? -1;
      } else {
        final error = result.error?.response?.data['errorDetails'];
        final errorMessage =
            error is List ? error.join(", ") : error as String?;
        message = '$message${errorMessage!}\n';
        successFlag = false;
      }
    }

    final result2 = await _studentProfile.inputStudentCV(cv, studentID);
    if (result2 is DataSuccess) {
    } else {
      final error = result2.error?.response?.data['errorDetails'];
      final errorMessage = error is List ? error.join(", ") : error as String?;
      message = '$message${errorMessage!}\n';
      successFlag = false;
    }

    if (state.transcriptPath != null) {
      File? transcript = File(state.transcriptPath!);

      final result3 = await _studentProfile.inputStudentTranscript(
          transcript, studentID);
      if (result3 is DataSuccess) {
      } else {
        final error = result3.error?.response?.data['errorDetails'];
        final errorMessage =
            error is List ? error.join(", ") : error as String?;
        message = '$message${errorMessage!}\n';
        successFlag = false;
      }
    }

    if (state.experienceList != null) {
      final result4 =
          await _inputProfile.putExperience(state.experienceList!, studentID);
      if (result4 is DataSuccess) {
      } else {
        final error = result4.error?.response?.data['errorDetails'];
        final errorMessage =
            error is List ? error.join(", ") : error as String?;
        message = '$message${errorMessage!}\n';
        successFlag = false;
      }
    }

    if (state.languageList != null) {
      final result5 =
          await _inputProfile.putLanguage(state.languageList!, studentID);
      if (result5 is DataSuccess) {
      } else {
        final error = result5.error?.response?.data['errorDetails'];
        final errorMessage =
            error is List ? error.join(", ") : error as String?;
        message = '$message${errorMessage!}\n';
        successFlag = false;
      }
    }

    if (state.educationList != null) {
      final result6 =
          await _inputProfile.putEducation(state.educationList!, studentID);
      if (result6 is DataSuccess) {
      } else {
        final error = result6.error?.response?.data['errorDetails'];
        final errorMessage =
            error is List ? error.join(", ") : error as String?;
        message = '$message${errorMessage!}\n';
        successFlag = false;
      }
    }

    if (successFlag) {
      emit(state.copyWith(
          isSuccess: true, message: 'Profile uploaded successfully'));
    } else {
      emit(state.copyWith(
          isSuccess: false, message: 'Profile upload failed: $message'));
    }

    hideLoading();
  }
}
