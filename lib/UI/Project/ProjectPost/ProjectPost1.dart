import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class ProjectPosting1 extends StatefulWidget  {
  const ProjectPosting1({super.key});

  @override
  State<ProjectPosting1> createState() => _ProjectPosting1State();
}

class _ProjectPosting1State extends State<ProjectPosting1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _projectNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("projectpost1_project1".tr()),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const CompanyDashboardWrapperRoute());
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "projectpost1_project2".tr(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 25),
              Text(
                "projectpost1_project3".tr(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _projectNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "projectpost1_project4".tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "projectpost1_project5".tr(),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "projectpost1_project6".tr(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ExampleTitle(title: "projectpost1_project7".tr()),
              ExampleTitle(title: "projectpost1_project8".tr()),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  next(context, _projectNameController.text);
                  }
                ,
                child: Text( "projectpost1_project9".tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> next(BuildContext context, String title) async {
      //put _projectNameController in to project title state
      context.read<ProjectPostCubit>().updateTitle(title);
      context.router.push(const ProjectPosting2Route());
    }

}

class ExampleTitle extends StatelessWidget {
  final String title;

  const ExampleTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Text('-'),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }


}



