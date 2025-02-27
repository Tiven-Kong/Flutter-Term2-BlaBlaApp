import 'package:flutter/material.dart';
import 'package:flutterterm2/theme/theme.dart';

import 'package:flutter/material.dart';

class RidePrefField extends StatelessWidget {
  final IconData icon;
  final String? initialValue;
  final String hintText;
  final Color textColor;
  final VoidCallback? onChanged;

  const RidePrefField({
    Key? key,
    required this.icon,
    this.initialValue,
    required this.hintText,
    required this.textColor,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue ?? '',
      style: TextStyle(color: textColor),
      readOnly: true, // Makes the field read-only
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: textColor),
        prefixIcon: Icon(icon, color: textColor),
        border: UnderlineInputBorder(), // Bottom border only
      ),
      onTap:onChanged,
    );

  }
}

