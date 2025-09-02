import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/container_on.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Last extends StatelessWidget {
  const Last({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<CategoriesViewModel>(
        builder: (context, vm, child) {
          return Padding(
            padding: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 30.h),
            child: SafeArea(
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: vm.categories.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 27.h,
                      crossAxisSpacing: 24.w,
                    ),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(14.r),
                        child: Image.network(
                          vm.categories[index].image,
                          width: 166.w,
                          height: 168.h,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  Text(
                    'welcome',
                    style: AppStyles.appBarT.copyWith(fontSize: 25.sp, color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '''Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.''',
                    style: AppStyles.tSW400S13Oq.copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 28.h),
                  ContainerOn(
                    backgroundColor: AppColors.pink,
                    foregroundColor: AppColors.pinkSubC,
                    text: 'I`m New',
                  ),
                  SizedBox(height: 20.h),
                  ContainerOn(
                    backgroundColor: AppColors.pink,
                    foregroundColor: AppColors.pinkSubC,
                    text: 'I`ve been here',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
