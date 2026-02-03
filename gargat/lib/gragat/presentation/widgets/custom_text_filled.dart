import 'package:flutter/material.dart';

/// A simple filled text field with sensible defaults.
///
/// Parameters:
/// - [controller]: optional controller for the field.
/// - [labelText]: label shown above the field.
/// - [hintText]: hint text shown when empty.
/// - [obscureText]: whether to hide the input (passwords).
/// - [keyboardType]: the keyboard type for the field.
class CustomTextFilled extends StatelessWidget {
  const CustomTextFilled({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged, required Container suffixIcon,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        isDense: true,
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor ?? Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
      ),
    );
  }
}