import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';



@RoutePage()
class CompanyProfileEdit extends StatefulWidget {
  @override
  _CompanyProfileEditState createState() => _CompanyProfileEditState();
}

class _CompanyProfileEditState extends State<CompanyProfileEdit> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
                  context.router.push(const LoginPageRoute());
            },
            icon: Icon(
              Icons.account_circle,
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
              "companyprofileinput_ProfileCreation1".tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "companyprofileinput_ProfileCreation2".tr(),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "companyprofileinput_ProfileCreation3".tr(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildInputField('Company Name'),
            SizedBox(height: 10),
            _buildInputField('Website'),
            SizedBox(height: 10),
            _buildInputField('Description'),
            Spacer(),
            Column(
              children: [
                _buildRadioOption(1, "companyprofileinput_ProfileCreation4".tr()),
                _buildRadioOption(2, "companyprofileinput_ProfileCreation5".tr()),
                _buildRadioOption(3, "companyprofileinput_ProfileCreation6".tr()),
                _buildRadioOption(4, "companyprofileinput_ProfileCreation7".tr()),
                _buildRadioOption(5, "companyprofileinput_ProfileCreation8".tr()),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add onPressed logic here
                      // Navigator.pushNamed(context, Routes.letGetStarted);
                    },
                    child: Text("companyprofileedit_ProfileCreation1".tr()),
                  ),
                  SizedBox(width: 10), // Add spacing between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Add onPressed logic here
                      // Navigator.pushNamed(context, Routes.letGetStarted);
                    },
                    child: Text("companyprofileedit_ProfileCreation2".tr()),
                  ),
                ],
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
        border: Border.all(),
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
