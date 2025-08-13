import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:day_36_darsda1/features/common/recipe_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(title: 'Forgot Your Password'),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: 356.w,
              child: Column(
                spacing: 20.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello there!',
                    style: AppStyles.tSW600S20Oq,
                  ),
                  Text(
                    'Enter your email address. We will send a code verification in the next step.',
                    style: AppStyles.tSW400S13Oq,
                  ),
                ],
              ),
            ),
            SizedBox(height: 43.h),
            RecipeTextFormField(

              label: 'Email',
              hint: 'example@example.com',
              validator: (value) {
                return '';
              },
              controller: emailController,
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(bottom: 40.h),
              child: RecipeContainer(
                text: 'Continue',
                onTap: () {},
                backgroundColor: AppColors.pink,
                foregroundColor: AppColors.pinkSubC,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
