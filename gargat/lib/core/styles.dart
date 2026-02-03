  import 'package:flutter/material.dart';

  /// Returns a boxed decoration with a subtle shadow and a border.
  BoxDecoration setBoxDecoration({
    required BorderRadius borderRadius,
    required Color borderColor,
    Color? color,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: borderRadius,
      border: Border.all(color: borderColor),
      boxShadow: boxShadow ?? [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8.0,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// Compatibility alias for the original misspelled function name.
  BoxDecoration setBoxDecorstion({
    required BorderRadius borderRadius,
    required Color borderColor,
    Color? color,
    List<BoxShadow>? boxShadow,
  }) =>
      setBoxDecoration(
        borderRadius: borderRadius,
        borderColor: borderColor,
        color: color,
        boxShadow: boxShadow,
      );

  /// Returns a default text style used across the app. Accepts overrides.
  TextStyle setTextStyle({
    Color? color,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    double? height, required FontWeight fontWight,
  }) {
    return TextStyle(
      color: color ?? Colors.black87,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
    );
  }