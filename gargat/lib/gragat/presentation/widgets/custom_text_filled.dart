import 'package:gragat/core/shared_packages.dart';


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
    this.onChanged, this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Widget?suffixIcon;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
    
      decoration: InputDecoration(
        suffixIcon:suffixIcon ,
        labelText: labelText,
        hintText: hintText,
        hintStyle: setTextStyle(fontWight: FontWeight.w300,fontSize: 12,color: lightGray),
        isDense: true,
        filled: true,
        fillColor: whiteColor,
        border: setOutllinedBorder(color:grayColor,radius: 8 ),
        enabledBorder: setOutllinedBorder(color:grayColor,radius: 8 ),
        focusedBorder: setOutllinedBorder(color: grayColor, radius: 8)
        
      ),
    );
  }
}