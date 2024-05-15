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
class StudentProfileInputTechStack extends StatefulWidget {
  const StudentProfileInputTechStack({Key? key}) : super(key: key);

  @override
  State<StudentProfileInputTechStack> createState() =>
      _StudentProfileInputTechStackState();
}

class _StudentProfileInputTechStackState
    extends State<StudentProfileInputTechStack> {
  String? selectedTechStackID;
  List<String> selectedSkills = [];
  List<LanguageInput> languages = [];
  List<EducationInput> educationList = [];

  void _addNewLanguage(String language, String level) {
    setState(() {
      final newLanguage = LanguageInput(
        languageName: language,
        level: level,
      );
      languages.add(newLanguage);
    });
  }

  void _deleteLanguage(String language) {
    setState(() {
      languages.removeWhere((element) => element.languageName == language);
    });
  }

  void _addNewEducation(String schoolName, int yearsStart, int yearsEnd) {
    setState(() {
      print("ID: , School: $schoolName, Start: $yearsStart, End: $yearsEnd");
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileInputCubit, StudentProfileInputState>(
        builder: (context, state) {
      final techStackList = state.techStackList;
      final skillSetList = state.skillSetList;

      return Scaffold(
        appBar: AppBar(
          title: Text(''),
          leading: IconButton(
            icon: Icon(Icons.home),
            color: Colors.black,
            onPressed: () {
              context.router.push(const SwitchAccountPageRoute());
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
                  onChanged: (value) {
                    setState(() {
                      selectedTechStackID = value;
                    });
                    // Save selected tech stack ID to the state
                  },
                  items: techStackList.map((tech) {
                    return DropdownMenuItem<String>(
                      value: tech!.id.toString(),
                      child: Text(tech.name),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                MultiSelectChipField(
                  items: skillSetList
                      .map((skill) => MultiSelectItem<String>(
                          skill!.id.toString(), skill!.name))
                      .toList(),
                  initialValue: [],
                  onTap: (values) {
                    selectedSkills = values.toList().cast<String>();
                    debugPrint(selectedSkills.toString());
                  },
                  chipColor: Colors.white,
                  selectedChipColor: Colors.purple,
                  textStyle: TextStyle(color: Colors.black),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Languages",
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
                            color: Color(0xFF406AFF),
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
                        color: Color(0xFF406AFF),
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
                              color: Color.fromARGB(255, 190, 190, 192),
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
                          "Educations",
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
                            color: Color(0xFF406AFF),
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
                              color: Color.fromARGB(255, 190, 190, 192),
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
