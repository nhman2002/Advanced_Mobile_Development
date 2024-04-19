import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ProjectPosting1 extends StatefulWidget {
  @override
  _ProjectPosting1State createState() => _ProjectPosting1State();
}

class _ProjectPosting1State extends State<ProjectPosting1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Post'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1/4 Let\'s start with a strong title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 25),
              Text(
                'This helps your post stand out to the right students. It\'s the first thing they\'ll see, so make it impressive!',
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _companyNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your post title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Write a title for your post',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Example titles',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ExampleTitle(title: 'Build responsive WordPress site with booking/payment functionality'),
              ExampleTitle(title: 'Facebook ad specialist need for product launch'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  }
                ,
                child: Text('Next Scope'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleTitle extends StatelessWidget {
  final String title;

  const ExampleTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text('-'),
          SizedBox(width: 10),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProjectPosting1(),
  ));
}

class $AppRouter {}

