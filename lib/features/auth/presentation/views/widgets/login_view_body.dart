import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/utils/app_styles.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/auth_custom_appbar.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/auth_custom_button.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() =>
      _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 76),
          AuthCustomAppBar(text: 'Log In'),
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
                          'Email or Mobile Number',
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
                        text: '***********',
                        showIcon: true,
                      ),
                      SizedBox(height: 14),
                      Align(
                        alignment:
                            AlignmentGeometry.centerRight,
                        child: Text(
                          'Forget Password',
                          style: AppStyles.medium14,
                        ),
                      ),
                      SizedBox(height: 60),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            GoRouter.of(
                              context,
                            ).push(AppRouter.kHomeView);
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
                        builder: (context, state) {
                          return AuthCustomButton(
                            text: 'Log In',
                            onTap: state is AuthLoading
                                ? null
                                : () {
                                    if (formKey
                                        .currentState!
                                        .validate()) {
                                      context
                                          .read<AuthCubit>()
                                          .signIn(
                                            email:
                                                _emailController
                                                    .text
                                                    .trim(),
                                            password:
                                                _passwordController
                                                    .text
                                                    .trim(),
                                          );
                                    } else {}
                                  },
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: AppStyles.light14,
                          ),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kSignUp);
                            },
                            child: Text(
                              'Sign Up',
                              style: AppStyles.light14
                                  .copyWith(
                                    color: Color(
                                      0xffE95322,
                                    ),
                                  ),
                            ),
                          ),
                        ],
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
