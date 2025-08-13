
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/auth/widgets/digit_form.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/common/recipe_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  static const otpLength = 6;
  final controller = List.generate(
    otpLength,
    (index) => TextEditingController(),
  );
  final focusNodes = List.generate(otpLength, (index) => FocusNode());

  @override
  void dispose() {
    controller.forEach((index) => index.dispose());
    focusNodes.forEach((index) => index.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(title: 'Forgot Your Password'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37),
          child: Column(
            spacing: 53.h,
            children: [
              SizedBox(
                width: 356.w,
                child: Column(
                  spacing: 20.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You’ve got mail',
                      style: AppStyles.tSW600S20Oq,
                    ),
                    Text(
                      'We will send you the verification code to your email address, check your email and put the code right below .',
                      style: AppStyles.tSW400S13Oq,
                    ),
                  ],
                ),
              ),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 14.w,
                  children: List.generate(
                    otpLength,
                    (index) => DigitForm(
                      controller: controller[index],
                      focusNode: focusNodes[index],
                      onChanged: (String value) {
                        if (value.length==1 && index<otpLength-1) {
                        focusNodes[index+1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              RichText(text: TextSpan(text: '')),
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
      ),
    );
  }
}
