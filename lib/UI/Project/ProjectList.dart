import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/UI/Project/ProjectDetail.dart';
import 'package:easy_localization/easy_localization.dart';

class ProjectListWidget extends StatefulWidget {
  @override
  _ProjectListWidgetState createState() => _ProjectListWidgetState();
}

class _ProjectListWidgetState extends State<ProjectListWidget> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              _searchText = value;
            });
          },
          decoration: InputDecoration(
            labelText: "projectlist_project1".tr(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Project $index'),
                onTap: () {
                  
                },
              );
            },
          ),
        ),      ],
    );
  }
}
