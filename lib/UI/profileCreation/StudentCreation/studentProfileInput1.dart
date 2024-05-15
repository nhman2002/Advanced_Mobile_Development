import 'dart:convert';
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
import 'package:student_hub/core/models/output/user_model.dart';

@RoutePage()
class StudentProfileInputTechStack extends StatefulWidget {
  const StudentProfileInputTechStack({Key? key}) : super(key: key);

  @override
  State<StudentProfileInputTechStack> createState() =>
      _StudentProfileInputTechStackState();
}

class _StudentProfileInputTechStackState
    extends State<StudentProfileInputTechStack> {
  late StudentProfileWithoutDate? studentProfile;
   String? selectedTechStackID;
  List<String> selectedSkills = [];
  List<LanguageInput> languages = [];
  List<EducationInput> educationList = [];
  bool isEdit = false;

  void _addNewLanguage(String language, String level) {
    setState(() {
      final LanguageInput newLanguage = LanguageInput(
        languageName: language,
        level: level,
      );
      languages.add(newLanguage);
          print("studentprofileinput1_ProfileCreation5".tr() + '$language' + "studentprofileinput1_ProfileCreation6".tr()+ '$level');
    });
  }

  void _deleteLanguage(String language) {
    setState(() {
      languages.removeWhere((element) => element.languageName == language);
    });
  }

  void _addNewEducation(String schoolName, int yearsStart, int yearsEnd) {
    setState(() {
      print("studentprofileinput1_ProfileCreation7".tr() + '$schoolName' + "studentprofileinput1_ProfileCreation8".tr() + '$yearsStart' + "studentprofileinput1_ProfileCreation9".tr() + '$yearsEnd');
      final EducationInput newEducation = EducationInput(
        schoolName: schoolName,
        startYear: yearsStart,
        endYear: yearsEnd,
      );
      educationList.add(newEducation);
    });
  }

  void _deleteEducation(String schoolName) {
    setState(() {
      educationList.removeWhere((element) => element.schoolName == schoolName);
    });
  }

  // void initializeProfile() {
  //   selectedTechStackID = studentProfile!.techStackId.toString();
  //   if (studentProfile!.skillSets != null) {
  //     selectedSkills =
  //         studentProfile!.skillSets!.map((e) => e.id.toString()).toList();
  //   }
  //   languages = studentProfile!.languages != null
  //       ? studentProfile!.languages!
  //           .map((e) =>
  //               LanguageInput(languageName: e.languageName, level: e.level))
  //           .toList()
  //       : [];
  //   educationList = studentProfile!.educations != null
  //       ? studentProfile!.educations!
  //           .map((e) => EducationInput(
  //               schoolName: e.schoolName,
  //               startYear: e.startYear,
  //               endYear: e.endYear))
  //           .toList()
  //       : [];
  //   debugPrint("educationList: $educationList");
  //   isEdit = true;
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileInputCubit, StudentProfileInputState>(
        builder: (context, state) {
      isEdit = state.isEdit ?? false;
      if (isEdit == true ) {
        selectedSkills = state.selectedSkillSetList ?? [];
        selectedTechStackID = state.selectedTechStackId.toString();
        languages = state.languageList?.languages ?? [];
        educationList = state.educationList?.educations ?? [];
      }
      final techStackList = state.techStackList;
      final skillSetList = state.skillSetList;

      return Scaffold(
        appBar: AppBar(
          title: Text(''),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              context.router.replace(const SwitchAccountPageRoute());
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("companyprofileinput_ProfileCreation1".tr(),
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text("studentprofileinput1_ProfileCreation1".tr(),
                    style: TextStyle(fontSize: 14)),
                SizedBox(height: 20),
                Text("studentprofileinput1_ProfileCreation2".tr(),
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("studentprofileinput1_ProfileCreation3".tr()),
                  value: selectedTechStackID,
                  onChanged: isEdit
                      ? null
                      : (value) {
                          setState(() {
                            selectedTechStackID = value;
                          });
                        },
                  items: techStackList.map((tech) {
                    return DropdownMenuItem<String>(
                      value: tech!.id.toString(),
                      child: Text(tech.name),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                isEdit!
                    ? Wrap(
                        children: selectedSkills.map((skillId) {
                          final skill = skillSetList.firstWhere(
                              (element) => element.id.toString() == skillId,
                              orElse: () => SkillSet(id: -1, name: '-1', createdAt: '', updatedAt: '', deletedAt: '')
                         ); // Handle case where skill is not found
                          if (skill != null) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: InputChip(
                                label: Text(skill.name),
                                onPressed: () {}, // Disabled onPressed event
                              ),
                            );
                          } else {
                            return Container(); // Return empty container if skill not found
                          }
                        }).toList(),
                      )
                    : MultiSelectChipField(
                        items: skillSetList
                                ?.map((skill) => MultiSelectItem<String>(
                                    skill!.id.toString(), skill.name))
                                .toList() ??
                            [],
                        initialValue: selectedSkills ?? [],
                        onTap: (values) {
                          setState(() {
                            selectedSkills = values.toList().cast<String>();
                          });
                          debugPrint(selectedSkills.toString());
                        },
                        chipColor: Colors.white,
                        selectedChipColor: Colors.purple,
                        textStyle: TextStyle(),
                        selectedTextStyle: TextStyle(),
                      ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "studentprofileinput1_ProfileCreation10".tr(),
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () async {
                            final result = await showDialog<LanguageInput>(
                              context: context,
                              builder: (BuildContext context) {
                                return PopUpLanguagesWidget(
                                    _addNewLanguage, languages);
                              },
                            );

                            if (result != null) {
                              setState(() {
                                languages.add(result);
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PopUpLanguagesEditWidget(
                                _deleteLanguage, languages);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 120,
                          child: ShowLanguagesWidget(
                              languages: languages,
                              isEditing: true,
                              deleteLanguage: _deleteLanguage),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "studentprofileinput1_ProfileCreation11".tr(),
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () async {
                            final result = await showDialog<EducationInput>(
                              context: context,
                              builder: (BuildContext context) {
                                return PopUpEducationEditWidget(
                                    _addNewEducation,
                                    _deleteEducation,
                                    '',
                                    0,
                                    0);
                              },
                            );

                            if (result != null) {
                              setState(() {
                                educationList.add(result);
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 170,
                          child: ShowSchoolWidget(
                            educationList: educationList,
                            deleteSchool: _deleteEducation,
                            addNewEducation: _addNewEducation,
                            isEditing: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    next(context);
                  },
                  child: Text("studentprofileinput1_ProfileCreation4".tr()),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> next(BuildContext context) async {
    context
        .read<StudentProfileInputCubit>()
        .setSelectedSkillSet(selectedSkills);
    context
        .read<StudentProfileInputCubit>()
        .setSelectedTechStackID(selectedTechStackID);

    context.read<StudentProfileInputCubit>().setLanguages(languages);
    context.read<StudentProfileInputCubit>().setEducation(educationList);
    context.router.push(const StudentProfileInputExperienceRoute());
  }
}
