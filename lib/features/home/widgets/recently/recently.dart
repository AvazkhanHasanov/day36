import 'package:day_36_darsda1/features/home/widgets/recently/recently_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/styles.dart';
import '../../managers/home_view_model.dart';

class Recently extends StatelessWidget {
  Recently({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 9.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recently Added',
            style: AppStyles.subtitle,
          ),
          Consumer<HomeViewModel>(
            builder: (context, vm, child) {
              return vm.isRecipeLoading
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                spacing: 18.w,
                children: [
                  ...List.generate(
                    2,
                        (index) {
                      return RecentlySizedBox(
                        title: vm.recipes[index].title,
                        rating: vm.recipes[index].rating,
                        timeRequired: vm.recipes[index].timeRequired,
                        photo: vm.recipes[index].photo,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
