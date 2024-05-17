import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
// import 'package:student_hub/widgets/theme/dark_mode.dart';

class ShowLanguagesWidget extends StatelessWidget {
  final List<LanguageInput> languages;
  final bool isEditing;
  final Function(String) _deleteLanguage;

  const ShowLanguagesWidget({super.key, 
    required this.languages,
    required this.isEditing,
    required Function(String) deleteLanguage,
  }) : _deleteLanguage = deleteLanguage;

  Color _getColorForLevel(String level) {
    switch (level) {
      case 'Native':
        return Colors.green;
      case 'Intermediate':
        return Colors.orange;
      case 'Basic':
        return Colors.red;
      case 'Advanced':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  Color _getBackgroundColorForLevel(Color color) {
    // Giảm độ sáng của màu gốc để có màu nhạt hơn
    return color.withOpacity(0.18);
  }

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = Provider.of<ThemeMode>(context) as bool;
    bool isDarkMode = false;
    return ListView.builder(
      itemCount: languages.length,
      itemBuilder: (context, index) {
        Color backgroundColor = _getBackgroundColorForLevel(
            _getColorForLevel(languages[index].level!));

        return Padding(
          padding: const EdgeInsets.fromLTRB(
              20, 10, 15, 5), // Điều chỉnh giá trị padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment
                .center, // Căn chỉnh các widget theo chiều dọc
            children: [
              Expanded(
                child: Text(
                  languages[index].languageName!,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 10, // Khoảng cách giữa Text và Container
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                
                child: Text(
                  languages[index].level!,
                  style: TextStyle(
                    color: _getColorForLevel(languages[index].level!),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                
              ),
              Visibility(
                visible: isEditing,
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'lib/common/ui/assets/delete.jpg',
                        width: 21,
                        height: 21,
                      ),
                      onPressed: () {
                        _deleteLanguage(languages[index].languageName!);
                      },
                    ),
                    const SizedBox(
                        width: 10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
