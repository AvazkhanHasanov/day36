import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/onboarding/managers/preferences_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PreferencesViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 36.w),
              child: Column(
                spacing: 20.h,
                children: [
                  Text(
                    'Select your cuisines preferences',
                    style: AppStyles.tSW600S20Oq,
                  ),

                  Text(
                    'Please select your cuisines preferences for a better recommendations or you can skip it.',
                    style: AppStyles.tSW400S13Oq,
                  ),

                  Consumer<PreferencesViewModel>(
                    builder: (context, vm, child) {
                      return Expanded(
                        child: GridView.builder(
                          itemCount: vm.categories.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11.r),
                                  child: Image.network(
                                    vm.categories[index].image,
                                    width: 98.w,
                                    height: 99.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  vm.categories[index].title,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.brownF9,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
