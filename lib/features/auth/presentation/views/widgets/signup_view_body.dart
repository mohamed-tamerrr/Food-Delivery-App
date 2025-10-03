import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/utils/app_styles.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/auth_custom_appbar.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/auth_custom_button.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_text_field.dart';

import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() =>
      _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "This field is required";
                          } else {
                            return null;
                          }
                        },
                        controller: _emailController,
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
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "This field is required";
                          } else {
                            return null;
                          }
                        },
                        controller: _passwordController,
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
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'This field is requried';
                          } else if (data !=
                              _passwordController.text) {
                            return 'It Should be the same password';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            _confirmPasswordController,
                        showIcon: true,
                        text: '***********',
                      ),
                      SizedBox(height: 60),
                      BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            GoRouter.of(context).pop();
                          } else if (state is AuthFail) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.msgError,
                                ),
                              ),
                            );
                          }
                        },
                        child: AuthCustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (formKey.currentState!
                                .validate()) {
                              context
                                  .read<AuthCubit>()
                                  .signUp(
                                    email: _emailController
                                        .text
                                        .trim(),
                                    password:
                                        _passwordController
                                            .text
                                            .trim(),
                                  );
                            } else {}
                          },
                        ),
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
