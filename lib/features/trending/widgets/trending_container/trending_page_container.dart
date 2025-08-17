import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/trending/managers/trending_view_model.dart';
import 'package:day_36_darsda1/features/trending/widgets/trending_container/container_photo.dart';
import 'package:day_36_darsda1/features/trending/widgets/trending_container/mini_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
              final trending = vm.trending!;
              return (vm.isTrendingLoading || vm.trending==null)
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 194.h,
                      width: 358.w,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: MiniContainer(
                              title: trending.title,
                              description: trending.description,
                              rating: trending.rating,
                              timeRequired: trending.timeRequired,
                            ),
                          ),
                          ContainerPhoto(
                            photo: trending.photo,
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
