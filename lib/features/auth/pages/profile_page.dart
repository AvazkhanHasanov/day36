import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/auth/widgets/auth_app_bar.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final genderController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    genderController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(title: "Profile"),
      body: Column(
        children: [
          SizedBox(
            width: 358.w,
            child: Column(
              children: [
                Text(
                  'Complete your profile',
                  style: AppStyles.titlle,
                ),
                Text(
                  'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
                  maxLines: 4,
                  style: AppStyles.subTextOq,
                ),
              ],
            ),
          ),
          Form(
            child: Column(
              children: [
                RecipeTextFormField(
                  label: 'Gender',
                  hint: 'Male/Female',
                  validator: (value) {},
                  controller: genderController,
                ),
                RecipeTextFormField(
                  label: "bio",
                  hint: 'About Yourself',
                  validator: (value) {},
                  controller: bioController,
                  minLine: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
