import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.showIcon = false,
    this.isSecure = true,
    required this.onChanged,
  });
  final String text;
  final bool showIcon;
  final bool isSecure;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is Required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: showIcon
            ? isSecure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility_outlined)
            : null,
        hint: Text(text, style: AppStyles.regular20),
        fillColor: Color(0xffF3E9B5),
        filled: true,
        enabledBorder: borderStyle(),
        focusedBorder: borderStyle(),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
