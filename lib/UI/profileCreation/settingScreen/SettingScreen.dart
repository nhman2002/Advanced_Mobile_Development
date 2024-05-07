import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  String _selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
  if (context.locale.languageCode == 'en') {
    _selectedLanguage = 'English';
  } else if (context.locale.toString() == 'vi') {
    _selectedLanguage = 'Tiếng Việt';
  }
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Theme:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: Text(_isDarkMode ? 'Dark Mode' : 'Light Mode'),
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Language:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                  if (newValue == 'English') {
                    context.setLocale(const Locale('en'));
                  } else if (newValue == 'Tiếng Việt') {
                    context.setLocale(const Locale('vi'));
                  }
                },
                items: <String>['English', 'Tiếng Việt']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
  }
}