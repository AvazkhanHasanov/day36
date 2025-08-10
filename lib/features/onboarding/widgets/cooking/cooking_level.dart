import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/cooking/cooking_navigation_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'for_level.dart';

class CookingLevel extends StatelessWidget {
  CookingLevel({super.key, required this.controller});

  final PageController controller;
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
      bottomNavigationBar: CookingNavigationAppBar(
        onTap: () {
          controller.animateToPage(
            1,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
