import 'package:day_36_darsda1/features/profile/widgets/text_button_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textBottoms extends StatelessWidget {
  const textBottoms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 9.w,
      children: [
        TextButtonProfile(
          text: 'Edit Profile',
          onPressed: () {},
        ),
        TextButtonProfile(
          text: 'Share Profile',
          onPressed: () {},
        ),
      ],
    );
  }
}
