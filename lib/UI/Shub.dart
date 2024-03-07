
import 'package:student_hub/routes.dart';
import 'package:flutter/material.dart';


class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.


  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Student Hub'),
                centerTitle: true, // Center the title horizontally
                
              ),
              body: Center(
                  child: Text('Hello World!'),
              ),
          )
      );
  }}