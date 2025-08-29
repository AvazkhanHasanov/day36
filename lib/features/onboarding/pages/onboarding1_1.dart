import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/allergic/allergic_bottom_navigarion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              text,
              style: AppStyles.tSW600S20Oq,
            ),
            Text(subText, style: AppStyles.tSW400S13Oq),
            Stack(
              children: [
                Image.network(
                  photo,
                  width: 430.w,
                  height: 720.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 430.w,
                  height: 284.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.beige, Colors.transparent],
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
