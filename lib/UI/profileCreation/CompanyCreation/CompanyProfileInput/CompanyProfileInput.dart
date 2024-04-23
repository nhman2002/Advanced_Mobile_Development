import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/company_model.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/profileCompany.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';

@RoutePage()
class CompanyProfileInput extends StatefulWidget {
  @override
  _CompanyProfileInputState createState() => _CompanyProfileInputState();
}

class _CompanyProfileInputState extends State<CompanyProfileInput> with SnackBarDefault {
  int? _selectedValue;
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  final _companyProfileRepository = getIt.get<CompanyProfileRepository>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const CompanyDashboardRoute());
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
                _buildRadioOption(0, "It's just me"),
                _buildRadioOption(1, "2-9 employees"),
                _buildRadioOption(2, "10-99 employees"),
                _buildRadioOption(3, "100-1000 employees"),
                _buildRadioOption(4, "More than 1000 employees"),
              ],
            ),
            SizedBox(height: 20),
            _buildInputField('Company Name', _companyNameController),

            SizedBox(height: 10),
            _buildInputField('Website', _websiteController),
            SizedBox(height: 10),
            _buildInputField('Description', _descriptionController),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Add onPressed logic here
                  handleInput(context);                             
                },
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

  Widget _buildInputField(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
        ),
      ),
    );
  }

  Future<void> handleInput(BuildContext context) async {
    final form = InputCompanyProfile().copyWith(
      companyName: _companyNameController.text,
      website: _websiteController.text,
      description: _descriptionController.text,
      size: _selectedValue
    );
    final _localStorage = getIt.get<LocalStorage>();

    final result = await _companyProfileRepository.inputCompanyProfile(form);
      if (result is DataSuccess) {
        _localStorage.saveString(key: StorageKey.companyID, value: result.data!.id.toString());
        showSnackBar(context, 'Company profile created successfully');
        context.router.push(const CompanyDashboardRoute());
      } else {
        showSnackBar(context, 'Failed to create company profile');        
        context.router.maybePop();
      }
  }
}
