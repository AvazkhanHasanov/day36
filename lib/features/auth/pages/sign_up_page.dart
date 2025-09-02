import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/data/models/auth/auth_model.dart';
import 'package:day_36_darsda1/features/auth/managers/auth_view_model.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:day_36_darsda1/features/common/widgets/recipe_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'email@email.com');
  final firstNameController = TextEditingController(text: 'Alibel');
  final lastNameController = TextEditingController(text: 'alibek');
  final phoneController = TextEditingController(text: '998914325464');
  final dateOfBirthController = TextEditingController(text: '2002-02-23');
  final passwordController = TextEditingController(text: '12345678');
  final confirmController = TextEditingController(text: '12345678');
  final userNameController = TextEditingController(text: 'ysergg');

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    userNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AuthAppBar(title: 'Sign Up'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.h),
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
                        label: 'User name',
                        hint: 'cyber',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' user name kiritshni unutdinggiz';
                          } else if (value.length < 3) {
                            return 'kamida 3 ta harif kiritilishi kerak';
                          }
                          return null;
                        },
                        controller: userNameController,
                      ),
                      RecipeTextFormField(
                        label: 'First Name',
                        hint: 'Alibek',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '  Ism  kiritshni unutdinggiz';
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
                            return ' Familiya  kiritshni unutdinggiz';
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
                        hint: 'DD / MM /YYYY',
                        readOnly: true,
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            final formatted =
                                "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                            dateOfBirthController.text = formatted;
                          }
                        },
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
                          } else if (passwordController.text != confirmController.text) {
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
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          AuthModel registerData = AuthModel(
                            username: userNameController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            birthDate: dateOfBirthController.text,
                            password: passwordController.text,
                          );
                          final result = await vm.register(
                            authModel: registerData,
                          );
                          if (result) {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: AppColors.brownF9,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      20.r,
                                    ),
                                  ),
                                  child: Container(
                                    width: 250.w,
                                    constraints: BoxConstraints(minHeight: 286),
                                    padding: EdgeInsets.all(36.r),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sign up succesful!",
                                          style: AppStyles.tSW600S20Oq.copyWith(color: AppColors.brownF9),
                                        ),
                                        Container(
                                          width: 82.w,
                                          height: 82.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              41.r,
                                            ),
                                            color: AppColors.pink,
                                          ),
                                          child: SvgPicture.asset(
                                            AppIcons.profile,
                                            width: 30.w,
                                            height: 44.h,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.redPinkMain,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada.",
                                          style: AppStyles.tSW400S13Oq.copyWith(color: AppColors.beige),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                              context,
                                            );
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Insof bilanda')),
                            );
                          }
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pop();
                          },
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
      ),
    );
  }
}
