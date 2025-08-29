import 'package:day_36_darsda1/features/home/widgets/trending/trending_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/colors.dart';
import '../../../../data/models/trending_model.dart';
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
            Selector<HomeViewModel, TrendingModel?>(
              selector: (context, trendingRecipes) => trendingRecipes.trendingRecipe,
              builder: (context, vm, child) {
                if (vm == null) {
                  return Center(child: CircularProgressIndicator());
                }
                final isLoading = context.select<HomeViewModel, bool>(((vm) => vm.isTrendingLoading));
                return SizedBox(
                  width: 364.w,
                  height: 200.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: HomeTrendingContainer(
                          title: vm.title,
                          description: vm.description,
                          rating: vm.rating,
                          timeRequired: vm.timeRequired,
                        ),
                      ),
                      isLoading
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
                                vm.photo,
                                width: 364.w,
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
