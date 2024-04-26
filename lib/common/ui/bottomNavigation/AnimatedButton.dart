import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color bgColor;
  final VoidCallback onPressed;

  const AnimatedButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    required this.bgColor,
    required this.onPressed,
  }) : super(key: key);

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
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey.shade300 : widget.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(  left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 30, color: widget.color),
            SizedBox(height: 5),
            Text(
              widget.label,
              style:
                  TextStyle(color: widget.color), // Use the provided text color
            ),
          ],
        ),
      ),
    );
  }
}
