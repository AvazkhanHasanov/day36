import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/trending/managers/trending_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/icons.dart';

class TrendingContainer extends StatelessWidget {
  const TrendingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 36.w,
        vertical: 9.h,
      ),
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 241.h,
        maxHeight: 251.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadiusGeometry.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most viewed Today'),
          Consumer<TrendingViewModel>(
            builder: (context, vm, child) {
              return vm.isTrendingLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 194.h,
                      width: 358.w,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 348.w,
                              constraints: BoxConstraints(
                                minHeight: 49.h,
                                maxHeight: 59.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.only(
                                  bottomLeft: Radius.circular(
                                    14,
                                  ),
                                  bottomRight: Radius.circular(
                                    14,
                                  ),
                                ),
                                color: AppColors.brownF9,
                                border: BoxBorder.all(
                                  width: 1,
                                  color: AppColors.pinkSubC,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 250.w,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vm.trending!.title,
                                          style: AppStyles.tSW400S13Black,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          vm.trending!.description,
                                          style: AppStyles.subTextMini,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        spacing: 8.w,
                                        children: [
                                          SvgPicture.asset(AppIcons.clock),
                                          Text(
                                            '${vm.trending!.timeRequired}min',
                                            style: AppStyles.subtextPink,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        spacing: 8.w,
                                        children: [
                                          Text(
                                            '${vm.trending!.rating}',
                                            style: AppStyles.subtextPink,
                                          ),

                                          SvgPicture.asset(AppIcons.star),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              child: Image.network(
                                vm.trending!.photo,
                                width: 358.w,
                                height: 143.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
