import 'package:day_36_darsda1/features/home/managers/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/styles.dart';
import '../home_page_gesture_detector.dart';

class TopChef extends StatelessWidget {
  const TopChef({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: context.push(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Top Chef',
              style: AppStyles.subtitle,
            ),
            Consumer<HomeViewModel>(
              builder: (context, vm, child) {
                return vm.isChefsLoading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Row(
                  spacing: 9.h,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      vm.chefs.length,
                          (index) {
                        return HomePageGestureDetector(
                          name: vm.chefs[index].firstName,
                          photo: vm.chefs[index].profilePhoto,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
