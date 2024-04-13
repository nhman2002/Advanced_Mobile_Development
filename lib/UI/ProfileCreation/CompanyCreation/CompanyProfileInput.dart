import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';

class CompanyProfileInput extends StatefulWidget {
  @override
  _CompanyProfileInputState createState() => _CompanyProfileInputState();
}

class _CompanyProfileInputState extends State<CompanyProfileInput> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const DashBoardRoute());
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Welcome to Student Hub',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tell us about your company and you will be on your way connect with high-skilled students',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'How many people are in your company?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildRadioOption(1, "It's just me"),
                _buildRadioOption(2, "2-9 employees"),
                _buildRadioOption(3, "10-99 employees"),
                _buildRadioOption(4, "100-1000 employees"),
                _buildRadioOption(5, "More than 1000 employees"),
              ],
            ),
            SizedBox(height: 20),
            _buildInputField('Company Name'),
            SizedBox(height: 10),
            _buildInputField('Website'),
            SizedBox(height: 10),
            _buildInputField('Description'),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Add onPressed logic here
                  context.router.push(const DashBoardRoute());                },
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedValue,
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue as int?;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildInputField(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
        ),
      ),
    );
  }
}
