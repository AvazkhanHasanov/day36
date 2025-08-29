import 'package:day_36_darsda1/features/home/managers/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/styles.dart';
import '../../../../data/models/top_chefs_model.dart';
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
            Selector<HomeViewModel, List<TopChefsModel>>(
              selector: (context, vm) => vm.chefs,
              builder: (context, chefs, child) {
                final isLoading = context.select<HomeViewModel, bool>((value) => value.isChefsLoading);
                if (isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (chefs.isEmpty) {
                  return Text(
                    'No chefs yet',
                    style: AppStyles.tSW400S15Oq,
                  );
                }
                return Row(
                  spacing: 9.h,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      chefs.length,
                      (index) {
                        return HomePageGestureDetector(
                          name: chefs[index].firstName,
                          photo: chefs[index].profilePhoto,
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
