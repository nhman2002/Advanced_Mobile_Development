import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
// import 'package:student_hub/widgets/theme/dark_mode.dart';

class PopUpLanguagesWidget extends StatefulWidget {
  final Function _addTask;
  final List<LanguageInput> languagesSelected;
  const PopUpLanguagesWidget(this._addTask, this.languagesSelected,
      {super.key});

  @override
  _PopUpLanguagesWidgetState createState() => _PopUpLanguagesWidgetState();
}

class _PopUpLanguagesWidgetState extends State<PopUpLanguagesWidget> {
  String _selectedLanguage = "null";
  String _selectedLevel = "null";

  List<String> checkLanguageExits(
      List<LanguageInput> languagesSelected, List<String> languages) {
    List<String> existingLanguages = [];
    for (var i = 0; i < languagesSelected.length; i++) {
      //remove the existing language from the list
      if (languages.contains(languagesSelected[i].languageName)) {
        existingLanguages.add(languagesSelected[i].languageName!);
      }
      {
        languages.remove(languagesSelected[i].languageName);
      }
    }
    return languages;
  }

  final List<String> languages = [
    'English',
    'French',
    'Spanish',
    'German',
    'Italian',
    'Portuguese',
    'Russian',
    'Chinese',
    'Japanese',
    'Korean',
    'Arabic',
    'Hindi',
    'Bengali',
    'Urdu',
    'Turkish',
    'Vietnamese',
    // Add more languages here
  ];

  final List<String> _levels = ["languagepop2".tr(), "languagepop3".tr(), "languagepop4".tr(), "languagepop5".tr()];
  bool showError = false;
  final bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = Provider.of<ThemeMode> (context ) as bool;
    bool isDarkMode = false;
    // return BlocBuilder<ThemeBloc, ThemeMode>(builder: (context, themeMode) {
    //   if (themeMode == ThemeMode.dark) {
    //     _isDarkMode = true;
    //   } else {
    //     _isDarkMode = false;
    //   }
    //   if (context.locale.languageCode == 'en') {
    //     _selectedLanguage = 'English';
    //   } else if (context.locale.toString() == 'vi') {
    //     _selectedLanguage = 'Tiếng Việt';
    //   }
    // });

    return AlertDialog(
      backgroundColor: isDarkMode ? const Color(0xFF212121) : Colors.white,
      title: Text("languagepop6".tr(),
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      content: SizedBox(
        height: 400.0,
        width: 300.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              CrossAxisAlignment.start, // Để căn chỉnh văn bản theo chiều ngang
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20), // Khoảng cách dưới cùng
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("languagepop7".tr(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                    )),
              ),
            ),
            const SizedBox(height: 10),
            DropdownSearch<String>(
              asyncItems: (filter) async => await getData(filter,
                  checkLanguageExits(widget.languagesSelected, languages)),
              compareFn: (item, selectedItem) => item == selectedItem,
              dropdownBuilder: (context, selectedItem) {
                return Text(
                  selectedItem ?? "languagepop7".tr(),
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  ),
                );
              },
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue ?? "null";
                });
              },
              // popupProps: PopupProps.menu(
              //   isFilterOnline: true,
              //   showSearchBox: true,
              //   showSelectedItems: true,
              //   loadingBuilder: _customLoadingBuilder,
              //   itemBuilder: _customItemBuilder,
              //   favoriteItemProps: FavoriteItemProps(
              //     showFavoriteItems: true,
              //     favoriteItemsAlignment: MainAxisAlignment.start,
              //   ),
              //   searchFieldProps: TextFieldProps(
              //     cursorColor: Color(0xFF406AFF),
              //     decoration: InputDecoration(
              //       hintText: "Search Language",
              //       hintStyle: GoogleFonts.poppins(
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("languagepop8".tr(),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                  )),
            ),
            Column(
              children: _levels.map((String level) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    level,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  leading: Radio<String>(
                    value: level,
                    groupValue: _selectedLevel,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedLevel = value ?? "null";
                      });
                    },
                    overlayColor:
                        MaterialStateProperty.all<Color>(const Color(0xFF406AFF)),
                    activeColor: const Color(0xFF406AFF),
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return const Color(0xFF406AFF); // Màu khi radio được chọn
                      }
                      return isDarkMode
                          ? Colors.white
                          : Colors.black; // Màu khi radio không được chọn
                    }),
                  ),
                );
              }).toList(),
            ),
            if (showError == true)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "educationpop7".tr(),
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(244, 213, 222, 255),
          ),
          child: Text("educationpop8".tr(),
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500)),
          onPressed: () {
            Navigator.of(context).pop();
            _selectedLanguage = "null";
            _selectedLevel = "null";
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF406AFF),
          ),
          child: Text('OK',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500)),
          onPressed: () {
            // Handle the OK button press
            //check existing language
            print("h$_selectedLanguage");
            print("hc$_selectedLevel");
            if (_selectedLanguage != "null" && _selectedLevel != "null") {
              widget._addTask(_selectedLanguage, _selectedLevel);
              Navigator.of(context).pop();
            } else {
              setState(() {
                showError = true;
              });
            }
          },
        ),
      ],
    );
  }
}

Widget _customItemBuilder(BuildContext context, String item, bool isSelected) {
  bool isDarkMode = Provider.of<ThemeMode>(context) as bool;
  return Container(
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Column(
            children: [
              Text(
                item,
                style: GoogleFonts.poppins(
                  color: isDarkMode
                      ? isSelected
                          ? const Color(0xFF406AFF)
                          : Colors.white
                      : isSelected
                          ? const Color(0xFF406AFF)
                          : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const Divider(
                thickness: 0.2,
              ),
            ],
          )));
}

Widget _customLoadingBuilder(BuildContext context, String item) {
  bool isDarkMode = Provider.of<ThemeMode>(context) as bool;
  return Container(
          color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
      child: const Center(
        child: CircularProgressIndicator(
        ),
      ));
}

Future<List<String>> getData(String? filter, List<String> languages) async {
  await Future.delayed(const Duration(milliseconds: 200));
  if (filter!.isNotEmpty) {
    return languages
        .where((skill) => skill.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }
  return languages;
}
