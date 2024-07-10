import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController ctrl;
  final bool isObscureText;
  final String label;
  final Color? focusedBorderColor;
  final Color? textColor;
  final Widget? suffix;

  const TextFieldCustom({
    Key? key,
    required this.ctrl,
    required this.label,
    this.focusedBorderColor,
    this.isObscureText = false,
    this.textColor,
    required this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: ctrl,
        obscureText: isObscureText,
        decoration: InputDecoration(
          suffixIcon: suffix,
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: TextStyle(
            color: textColor ?? Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderColor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
