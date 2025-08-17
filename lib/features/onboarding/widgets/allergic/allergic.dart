import 'package:day_36_darsda1/features/onboarding/managers/allergic_view_model.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/allergic/allergic_bottom_navigarion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class Allergic extends StatelessWidget {
  const Allergic({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllergicViewModel(allergicRepo: context.read()),
      builder: (context, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Column(
                spacing: 20.h,
                children: [
                  Text(
                    '¿You have any allergic?',
                    style: AppStyles.tSW600S20Oq,
                  ),

                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.',
                    style: AppStyles.tSW400S13Oq,
                  ),

                  Consumer<AllergicViewModel>(
                    builder: (context, vm, child) {
                      return Expanded(
                        child: GridView.builder(
                          itemCount: vm.categories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 11.w,
                                mainAxisSpacing: 19.h,
                                mainAxisExtent: 141.h,
                              ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11.r),
                                  child: Image.network(
                                    vm.categories[index].image,
                                    width: 112.w,
                                    height: 112.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  vm.categories[index].title,
                                  style: TextStyle(
                                    fontSize: 15.sp,
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
          bottomNavigationBar: AllergicBottomNavigationBar(
            onTap: () {},
            backgroundColor: AppColors.redPinkMain,
            foregroundColor: AppColors.brownF9,
          ),
        );
      },
    );
  }
}
