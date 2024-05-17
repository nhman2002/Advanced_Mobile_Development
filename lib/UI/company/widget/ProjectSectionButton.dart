  import 'package:flutter/material.dart';

Widget buildProjectSectionButton(
    String label,
    Color color,
    bool isBlue,
    VoidCallback onPressed,
    ThemeData theme,
  ) {
    final buttonColor = isBlue ? theme.colorScheme.primaryContainer : theme.colorScheme.secondary;
    final textColor = isBlue ? theme.colorScheme.onPrimaryContainer : theme.colorScheme.onSecondary;

    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            style: TextStyle(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }