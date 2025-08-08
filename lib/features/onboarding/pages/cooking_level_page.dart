import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/common/icon_button_app_bar.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/cooking_navigation_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/for_level.dart';

class CookingLevelPage extends StatelessWidget {
  CookingLevelPage({super.key});

  final List<Map<String, dynamic>> level = [
    {
      'level': 'Novice',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
    {
      'level': 'Intermediate',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
    {
      'level': 'Advanced',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
    {
      'level': 'Professional',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButtonAppBar(
          icon: AppIcons.backArrow,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.redPinkMain,
          onPressed: () {},
        ),
        centerTitle: true,
        title: Container(
          alignment: Alignment.topLeft,
          width: 230.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: AppColors.colorD9,
            borderRadius: BorderRadiusGeometry.circular(6.r),
          ),
          child: Container(
            width: 65.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadiusGeometry.circular(6.r),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Column(
            spacing: 20.h,
            children: <Widget>[
              Text(
                '¿What is your cooking level?',
                style: AppStyles.tSW600S20Oq,
              ),
              Text(
                'Please select you cooking level for a better recommendations.',
                style: AppStyles.tSW400S13Oq,
              ),
              Column(
                spacing: 32.h,
                children: [
                  ...List.generate(
                    level.length,
                    (index) {
                      return ForLevel(
                        onTap: () {},
                        title: level[index]['level'],
                        description: level[index]['description'],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CookingNavigationAppBar(),
    );
  }
}
