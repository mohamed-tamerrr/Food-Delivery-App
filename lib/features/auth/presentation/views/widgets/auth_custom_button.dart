import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_styles.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 207,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffE95322),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(text, style: AppStyles.medium24),
      ),
    );
  }
}
