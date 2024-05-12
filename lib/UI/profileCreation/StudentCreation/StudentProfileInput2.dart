import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';


class Project {
  String title;
  final String subtitle;
  String description;
  List<String> selectedSkillSet;

  Project({
    required this.title,
    required this.subtitle,
    required this.description,
    this.selectedSkillSet = const [],
  });
}

@RoutePage()
class StudentProfileInputExperience extends StatefulWidget {
  @override
  _StudentProfileInputExperienceState createState() => _StudentProfileInputExperienceState();
}

class _StudentProfileInputExperienceState extends State<StudentProfileInputExperience> {
  final List<ExperienceInput> projects = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

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
        _startDateController.text = DateFormat('dd-MM-yyyy').format(_startDate);
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
        _endDateController.text = DateFormat('dd-MM-yyyy').format(_endDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: _showAddProjectDialog,
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              _buildProjectCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCards() {
    return Column(
      children: List.generate(projects.length, (index) {
        return Card(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
          color: Colors.blue[300],
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'CON ACAC',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey[600]),
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
                _showSkillSet(projects[index] ),
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
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: project.skillSets!.map((skill) => _buildSkillSetButton(skill)).toList(),
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
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Row _buildIconButtons(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit_outlined),
          onPressed: () => _showEditProjectDialog(index),
        ),
        IconButton(
          icon: Icon(Icons.delete_outlined),
          onPressed: () => _deleteProject(index),
        ),
      ],
    );
  }

  void _showAddProjectDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
                _buildSkillSet(),
                SizedBox(height: 16.0),
                _datePicker(context),
                SizedBox(height: 16.0),
                _buildTextField('Description', _descriptionController),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed:() {_addProject;
                  Navigator.of(context).pop();
                  }
                  ,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditProjectDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Project',
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
                _buildSkillSet(),
                SizedBox(height: 16.0),
                _datePicker(context),
                SizedBox(height: 16.0),
                _buildTextField('Description', _descriptionController),
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
      String subtitle = '${DateFormat('dd-MM').format(_startDate)} - ${DateFormat('dd-MM').format(_endDate)}';
      int monthsDifference = _endDate.month - _startDate.month;
      projects.add(
        ExperienceInput(
          title: _titleController.text,
          
          description: _descriptionController.text,
          skillSets: ['Skill 1', 'Skill 2'],
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
    setState(() {
      String subtitle = '${DateFormat('dd-MM').format(_startDate)} - ${DateFormat('dd-MM').format(_endDate)}';
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
    Navigator.pop(context);
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSkillSet() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(2.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: ['Skill 1', 'Skill 2']
                .map((skill) => _buildSkillSetButton(skill))
                .toList(),
          ),
        ),
      ),
    );
  }
}

