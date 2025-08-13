import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/data/models/auth/auth_model.dart';
import 'package:day_36_darsda1/features/auth/managers/auth_view_model.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:day_36_darsda1/features/common/recipe_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    confirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AuthAppBar(title: 'Sign Up'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  spacing: 10.h,
                  children: [
                    RecipeTextFormField(
                      label: 'First Name',
                      hint: 'Alibek',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Familiya va ism  kiritshni unutdinggiz';
                        } else if (value.length <= 3) {
                          return 'kamida 4 ta harif kiritilishi kerak';
                        }
                        return null;
                      },
                      controller: firstNameController,
                    ),
                    RecipeTextFormField(
                      label: 'Last name',
                      hint: 'Aliyev',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Familiya va ism  kiritshni unutdinggiz';
                        } else if (value.length <= 3) {
                          return 'kamida 4 ta harif kiritilishi kerak';
                        }
                        return null;
                      },
                      controller: lastNameController,
                    ),
                    RecipeTextFormField(
                      label: 'Email',
                      hint: 'example@example.com',
                      validator: (value) {
                        final emailRegExp = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
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
                      label: 'Mobile Number',
                      hint: '+ 123 456 789',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Telefon Raqamni kiritishni unutdingiz';
                        } else if (value.length > 9 && value.length < 12) {
                          return 'hazillashma bola';
                        }
                        return null;
                      },
                      controller: phoneController,
                    ),
                    RecipeTextFormField(
                      label: 'Date of birth',
                      hint: 'DD / MM /YYY',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tug`ilgan kuni kiritishni unutdingiz';
                        }
                        return null;
                      },
                      controller: dateOfBirthController,
                    ),
                    RecipeTextFormField(
                      label: 'Password',
                      hint: '● ● ● ● ● ● ● ●',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'parol kitirish majburiy';
                        } else if (value.length < 8) {
                          return "parol eng kamida 8 ta raqamdan iborat bo`lsin";
                        }
                        return null;
                      },
                      isPassword: true,
                    ),
                    RecipeTextFormField(
                      label: 'Confirm Password',
                      hint: '● ● ● ● ● ● ● ●',
                      controller: confirmController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'parolni tasdiqlashni unutingiz';
                        } else if (passwordController.text !=
                            confirmController.text) {
                          return ' password mos kelmadi';
                        }
                        return null;
                      },
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '    By continuing, you agree to\n',
                  style: AppStyles.subTextS14,
                  children: [
                    TextSpan(
                      text: ' Terms of Use and Privacy Policy.',
                      style: AppStyles.tSW600S14,
                    ),
                  ],
                ),
              ),

              Consumer<AuthViewModel>(
                builder: (context, vm, child) {
                  return RecipeContainer(
                    text: 'Sign Up',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        AuthModel registerData = AuthModel(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          phoneNumber: phoneController.text,
                          birthDate: dateOfBirthController.text,
                          password: passwordController.text,
                        );
                        context.read<AuthViewModel>().registerEvent(
                          authModel: registerData,
                          onError: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Hatolik yuz berdi')),
                            );
                          },
                          onSuccess: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text('Muvaffaqiyatli'),
                              ),
                            );
                          },
                        );
                        print('Register Data: $registerData');
                      }
                    },
                    backgroundColor: AppColors.redPinkMain,
                    foregroundColor: AppColors.brownF9,
                  );
                },
              ),

              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      text: '  Log In',
                      style: TextStyle(color: AppColors.redPinkMain),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
