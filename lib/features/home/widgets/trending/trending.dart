import 'package:day_36_darsda1/features/home/widgets/trending/trending_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/colors.dart';
import '../../managers/home_view_model.dart';

class Trending extends StatelessWidget {
  const Trending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 214.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadiusGeometry.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w),
        child: Column(
          spacing: 9.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending Recipe',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.redPinkMain,
              ),
            ),
            Consumer<HomeViewModel>(
              builder: (context, vm, child) {
                return SizedBox(
                  width: 364.w,
                  height: 200.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: HomeTrendingContainer(
                          title: vm.trendingRecipe?.title ?? '',
                          description: vm.trendingRecipe?.description ?? '',
                          rating: vm.trendingRecipe?.rating ?? 0,
                          timeRequired: vm.trendingRecipe?.timeRequired ?? 0,
                        ),
                      ),
                      vm.isTrendingLoading
                          ? Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 364.w,
                          height: 143.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(
                              14.r,
                            ),
                            color: Colors.amber,
                          ),
                        ),
                      )
                          : ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(14.r),
                        child: Image.network(
                          vm.trendingRecipe?.photo ?? '',
                          width: 358.w,
                          height: 143.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
