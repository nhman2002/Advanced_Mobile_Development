import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/UI/Project/ProjectList.dart';

class ProjectListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("projectdetail_project1".tr()),
      ),
      body: ProjectListWidget(),
    );
  }
}