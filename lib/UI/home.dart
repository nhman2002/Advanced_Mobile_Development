import 'package:flutter/material.dart';

void main() {
  runApp( HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: Text('Student Hub'),
                  actions: [
                      IconButton(
                          onPressed: () {
                              Navigator.of(context).pushNamed('/login');
                          },
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 40.0,
                          ),                          
                      ),
                  ],
              ),
              body: Center(
                  child: Text('Hello World!'),
              ),
          )
      );
  }}