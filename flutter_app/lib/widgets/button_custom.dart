import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const ButtonCustom({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        ),
      ),
    );
  }
}
