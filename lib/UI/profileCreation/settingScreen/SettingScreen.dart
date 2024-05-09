import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/common/ui/theme/bloc/theme_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  String _selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, themeMode) {

        if (themeMode == ThemeMode.dark) {
          _isDarkMode = true;
        } else {
          _isDarkMode = false;
        }
        if (context.locale.languageCode == 'en') {
          _selectedLanguage = 'English';
        } else if (context.locale.toString() == 'vi') {
          _selectedLanguage = 'Tiếng Việt';
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("settingscreen_ProfileCreation1".tr()),
            backgroundColor: Colors.purple,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "settingscreen_ProfileCreation2".tr(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SwitchListTile(
                  title: Text(_isDarkMode ? "settingscreen_ProfileCreation3".tr() : "settingscreen_ProfileCreation4".tr()),
                  value: _isDarkMode,
                  onChanged: (value) {
                    BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(value));
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  "settingscreen_ProfileCreation5".tr(),
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
      },
    );
  }
}
