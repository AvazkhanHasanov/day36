import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/allergic/allergic_bottom_navigarion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class First extends StatelessWidget {
  const First({
    super.key,
    required this.text,
    required this.subText,
    required this.photo,
    required this.onTap,
  });

  final String text, subText, photo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: AppStyles.appBarT.copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(subText, style: AppStyles.tSW400S13Oq.copyWith(color: Theme.of(context).colorScheme.primary)),
                ],
              ),
            ),
            Stack(
              children: [
                Image.network(
                  photo,
                  width: 430.w,
                  height: 800.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 430.w,
                  height: 284.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Theme.of(context).colorScheme.primary, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AllergicBottomNavigationBar(
        onTap: onTap,
        backgroundColor: AppColors.pink,
        foregroundColor: AppColors.pinkSubC,
      ),
    );
  }
}
