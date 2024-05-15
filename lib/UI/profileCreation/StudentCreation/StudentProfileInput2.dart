import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/ProfileCreation/StudentCreation/StudentProfileInput3.dart';
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
  List<SkillSet> skillSetList = [];
  List<ExperienceInput> projects = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  List<String> selectedSkills = [];
  bool isEdit = false;

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  // String? selectedTechStackID;
  // List<String> selectedSkills = [];
  // List<Language> languages = [];
  // List<EducationInput> educationList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileInputCubit, StudentProfileInputState>(
      builder: (context, state) {
        skillSetList =
            context.read<StudentProfileInputCubit>().state.skillSetList;
        isEdit = context.read<StudentProfileInputCubit>().state.isEdit ?? false;
        if (isEdit) {
          var projectsList = context.read<StudentProfileInputCubit>().state.experienceList; 
          //convert the list of experience to list of ExperienceInput
          projects = projectsList!.experiences!.map((e) => ExperienceInput().copyWith(title: e.title, description: e.description, startMonth: e.startMonth, endMonth: e.endMonth, skillSets: e.skillSets)).toList();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Experiences'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'Experiences',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Tell us about yourself and you will be on your way connect with real-world projects',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Projects',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: _showAddProjectDialog,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _buildProjectCards(),
                  ElevatedButton(
                    onPressed: () {
                      next(context);
                    },
                    child: Text("studentprofileinput2_ProfileCreation4".tr()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

Future<void> _selectStartDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _startDate,
    firstDate: DateTime(2020),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != _startDate) {
    setState(() {
      _startDate = picked;
      _startDateController.text = DateFormat('MM-yyyy').format(_startDate);
    });
  }
}

Future<void> _selectEndDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _endDate.isBefore(_startDate) ? _startDate : _endDate,
    firstDate: _startDate,
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != _endDate) {
    setState(() {
      _endDate = picked;
      _endDateController.text = DateFormat('MM-yyyy').format(_endDate);
    });
  }
}

  Widget _buildProjectCards() {
    return Column(
      children: List.generate(projects.length, (index) {
        // String startDate = DateFormat('MM-yyyy').parse(projects[index].startMonth as String) ;
String startDate = DateFormat('MM-yyyy').format(
    DateFormat('MM-yyyy').parse(projects[index].startMonth as String));
String endDate = DateFormat('MM-yyyy').format(
    DateFormat('MM-yyyy').parse(projects[index].endMonth as String));

// String formattedDate = '${projects[index].startMonth?.day}-${projects[index].startMonth.month}';
// DateTime formattedDate = DateFormat('dd-MM').format(projects[index].startMonth);

        return Card(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projects[index].title ?? '',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${startDate} - ${endDate}',
                      // '${DateFormat('MM-yyyy').format(projects[index].startMonth as DateTime)} - ${DateFormat('MM-yyyy').format(projects[index].endMonth as DateTime)}',
                      // 'CON',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                _buildIconButtons(index),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projects[index].description ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Skillset',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                _showSkillSet(projects[index]),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _showSkillSet(ExperienceInput project) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          //skillSets is a list of index of skillsetList, build the buttons using the index
          children: project.skillSets!
              .map((index) => _buildSkillSetButton(
                  skillSetList[int.parse(index)]?.name ?? ''))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSkillSetButton(String skill) {
    return TextButton(
      onPressed: null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.grey[400]!;
          },
        ),
      ),
      child: Text(
        skill,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Row _buildIconButtons(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit_outlined),
          onPressed: () => {_showEditProjectDialog(index, Theme.of(context))},
        ),
        IconButton(
          icon: Icon(Icons.delete_outlined),
          onPressed: () => _deleteProject(index),
        ),
      ],
    );
  }

  Future<void> _showAddProjectDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Project',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                _buildTextField('Title', _titleController),
                SizedBox(height: 16.0),
                Text(
                  'Skillset',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
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
                  textStyle: TextStyle(),
                  selectedTextStyle: TextStyle(),
                ),
                SizedBox(height: 16.0),
                _datePicker(context),
                SizedBox(height: 16.0),
                _buildTextField('Description', _descriptionController),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _addProject();
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditProjectDialog(int index, ThemeData theme) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Project',
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                    // color: theme.colorScheme.onTertiary
                  ),
                ),
                SizedBox(height: 16.0),
                _buildTextField(projects[index].title, _titleController),
                SizedBox(height: 16.0),
                Text(
                  'Skillset',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
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
                  textStyle: TextStyle(),
                  selectedTextStyle: TextStyle(),
                ),
                SizedBox(height: 16.0),
                _datePicker(context),
                SizedBox(height: 16.0),
                _buildTextField(
                    projects[index].description, _descriptionController),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _editProject(index),
                  child: Text('Edit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addProject() {
    setState(() {
      String subtitle =
          '${DateFormat('dd-MM').format(_startDate)} - ${DateFormat('dd-MM').format(_endDate)}';
      int monthsDifference = _endDate.month - _startDate.month;
      // print(monthsDifference);
      projects.add(
        ExperienceInput(
          title: _titleController.text,
          description: _descriptionController.text,
          startMonth: _startDateController.text,
          endMonth: _endDateController.text,
          skillSets: selectedSkills,
        ),
      );
      _titleController.clear();
      _descriptionController.clear();
      _startDate = DateTime.now();
      _endDate = DateTime.now();
      _startDateController.clear();
      _endDateController.clear();
    });
    _buildProjectCards();
  }

  void _editProject(int index) {
    // print(projects[index].startMonth);
    setState(() {
      String subtitle =
          '${DateFormat('dd-MM').format(_startDate)} - ${DateFormat('dd-MM').format(_endDate)}';
      int monthsDifference = _endDate.month - _startDate.month;
      projects[index] = ExperienceInput(
        title: _titleController.text,
        description: _descriptionController.text,
        skillSets: ['Skill 1', 'Skill 2'],
      );
      _titleController.clear();
      _descriptionController.clear();
      _startDate = DateTime.now();
      _endDate = DateTime.now();
      _startDateController.clear();
      _endDateController.clear();
    });
    // Navigator.pop(context);
  }

  void _deleteProject(int index) {
    setState(() {
      projects.removeAt(index);
    });
  }

  Row _datePicker(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _selectStartDate(context),
            child: IgnorePointer(
              child: TextField(
                controller: _startDateController,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () => _selectEndDate(context),
            child: IgnorePointer(
              child: TextField(
                controller: _endDateController,
                decoration: InputDecoration(
                  labelText: 'End Date',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String? title, TextEditingController controller) {
    // print(controller);

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Widget _buildSkillSet(BuildContext context) {
  //   final skillsetList =  context.read<StudentProfileInputCubit>().state.skillSetList;
  //   return Container(
  //     height: 150,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(
  //         color: Colors.grey,
  //         width: 1.0,
  //       ),
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     child: SingleChildScrollView(
  //       padding: EdgeInsets.all(2.0),
  //       child: Padding(
  //         padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
  //         child: Wrap(
  //           spacing: 10.0,
  //           runSpacing: 10.0,
  //           children: skillsetList
  //               .map((skill) => _buildSkillSetButton(skill))
  //               .toList(),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future<void> next(BuildContext context) async {
    context.read<StudentProfileInputCubit>().setExperience(projects);

    context.router.push(const StudentProfileInputCVRoute());
  }
}
