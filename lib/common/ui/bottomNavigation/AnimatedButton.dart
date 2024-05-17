import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final IconData icon;
  final Badge badge;
  final String label;
  final bool isSelected;
  // final Color color;
  // final Color bgColor;
  final VoidCallback onPressed;

  const AnimatedButton({
    super.key,
    required this.icon,
    required this.badge,
    required this.label,
    required this.isSelected,
    // required this.bgColor,
    required this.onPressed,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isPressed = false;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed(); // Call the onPressed callback
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon,
                size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              widget.label, // Use the provided text color
            ),
          ],
        ),
      ),
    );
  }
}
