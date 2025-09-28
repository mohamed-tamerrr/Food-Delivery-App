import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/app_styles.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/auth_custom_appbar.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/auth_custom_button.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:food_delivery_app/features/auth/data/cubit/auth_cubit/auth_cubit.dart';

import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 76),
          AuthCustomAppBar(text: 'New Account'),
          SizedBox(height: 59),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 34),
                      Align(
                        alignment:
                            AlignmentGeometry.centerLeft,
                        child: Text(
                          'Welcome',
                          style: AppStyles.semoBold24,
                        ),
                      ),
                      SizedBox(height: 12),
                      Align(
                        alignment:
                            AlignmentGeometry.centerLeft,
                        child: Text(
                          'Email',
                          style: AppStyles.medium20,
                        ),
                      ),

                      CustomTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        text: 'Example@gmail.com',
                      ),
                      SizedBox(height: 22),
                      Align(
                        alignment:
                            AlignmentGeometry.centerLeft,
                        child: Text(
                          'Password',
                          style: AppStyles.medium20,
                        ),
                      ),
                      SizedBox(height: 10),

                      CustomTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        showIcon: true,
                        text: '***********',
                      ),
                      SizedBox(height: 14),
                      Align(
                        alignment:
                            AlignmentGeometry.centerLeft,
                        child: Text(
                          'Confirm Password',
                          style: AppStyles.medium20,
                        ),
                      ),
                      SizedBox(height: 10),

                      CustomTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        showIcon: true,
                        text: '***********',
                      ),
                      SizedBox(height: 60),
                      AuthCustomButton(
                        text: 'Sign Up',
                        onTap: () {
                          if (formKey.currentState!
                              .validate()) {
                            BlocProvider.of<AuthCubit>(
                              context,
                            ).signUp(
                              email: email!,
                              password: password!,
                            );

                            GoRouter.of(context).pop();
                          } else {}
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
