import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/app_styles.dart';

class AuthCustomAppBar extends StatelessWidget {
  const AuthCustomAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 34),

        Text(text, style: AppStyles.bold28),
      ],
    );
  }
}
