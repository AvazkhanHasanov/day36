import 'package:day_36_darsda1/core/route/routes.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/data/models/auth/login_model.dart';
import 'package:day_36_darsda1/features/auth/managers/auth_view_model.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:day_36_darsda1/features/common/recipe_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, vm, child) {

        return vm.isLoginLoading
            ? CircularProgressIndicator()
            : Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AuthAppBar(
                  title: 'Login',
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 27.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            spacing: 10.h,
                            children: [
                              RecipeTextFormField(
                                label: 'Email',
                                hint: 'example@example.com',
                                validator: (value) {
                                  final emailRegExp = RegExp(
                                    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  );
                                  if (value == null || value.isEmpty) {
                                    return ' Emailni kiritshni unutdinggiz';
                                  } else if (!emailRegExp.hasMatch(value)) {
                                    return 'Email farmati noto`g`ri';
                                  }
                                  return null;
                                },
                                controller: emailController,
                              ),
                              RecipeTextFormField(
                                label: 'Password',
                                hint: '● ● ● ● ● ● ● ●',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'parol kitirish majburiy';
                                  } else if (value.length < 8) {
                                    return "parol eng kamida 8 ta raqamdan iborat bo`lsin";
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 60.h),
                        RecipeContainer(
                          text: 'Log In',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              LoginModel loginData = LoginModel(
                                login: emailController.text,
                                password: passwordController.text,
                              );
                              final result = await vm.loginEvent(
                                loginModel: loginData,
                              );
                              if (result) {
                                context.go(Routes.home);
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(content: Text('Muvaffaqiyatli')),
                                // );
                              }
                            }
                          },
                          backgroundColor: AppColors.pink,
                          foregroundColor: AppColors.pinkSubC,
                        ),

                        RecipeContainer(
                          text: 'Sign Up',
                          onTap: () {
                            context.push(Routes.signUp);
                          },
                          backgroundColor: AppColors.pink,
                          foregroundColor: AppColors.pinkSubC,
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          'Forgot Password?',
                          style: AppStyles.tSW600S14,
                        ),
                        SizedBox(height: 44.h),
                        Text(
                          'or sign up with',
                          style: AppStyles.subTextMiniOq,
                        ),
                        Row(
                          children: [],
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'don\'t have an account?',
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.push(Routes.signUp);
                                  },
                                text: ' Sing Up',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
