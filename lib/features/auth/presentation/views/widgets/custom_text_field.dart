import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.showIcon = false,
    required this.controller,
    this.validator,
  });
  final String text;
  final bool showIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() =>
      _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.showIcon ? _obscureText : false,

      decoration: InputDecoration(
        suffixIcon: widget.showIcon
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        hint: Text(widget.text, style: AppStyles.regular20),
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
