import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:day_36_darsda1/features/common/recipe_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AuthAppBar(title:'Login',),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            spacing: 27.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  spacing: 10.h,
                  children: [
                    RecipeTextFormField(
                      label: 'Email',
                      hint: 'example@example.com',
                      validator: (value) {},
                      controller: emailController,
                    ),
                    RecipeTextFormField(
                      label: 'Password',
                      hint: '● ● ● ● ● ● ● ●',
                      validator: (value) {},
                      controller: emailController,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              RecipeContainer(
                text: 'Log In',
                onTap: () {},
                backgroundColor: AppColors.pink,
                foregroundColor: AppColors.pinkSubC,
              ),
              RecipeContainer(
                text: 'Sign Up',
                onTap: () {},
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
  }
}
