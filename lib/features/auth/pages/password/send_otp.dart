import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/auth/widgets/text_column.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:day_36_darsda1/features/common/widgets/recipe_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendOTP extends StatefulWidget {
  const SendOTP({super.key});

  @override
  State<SendOTP> createState() => _SendOTPState();
}

class _SendOTPState extends State<SendOTP> {
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
            TextColumn(
              title: 'Hello there!',
              subtitle: 'Enter your email address. We will send a code verification in the next step.',
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
              padding: EdgeInsets.only(bottom: 40.h),
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
