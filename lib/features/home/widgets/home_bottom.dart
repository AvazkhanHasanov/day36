import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../managers/home_view_model.dart';

class HomeBottom extends StatelessWidget implements PreferredSizeWidget {
  const HomeBottom({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(39.h);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<HomeViewModel>(
        builder: (context, vm, child) {
          return vm.isCategoryLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 11.w,
              children: [
                ...List.generate(
                  vm.categories.length,
                      (index) {
                    bool isSelected = vm.selectedIndex == index;
                    return GestureDetector(
                      onTap: () => vm.selectedCategory(index),

                      child: Container(
                        alignment: Alignment.center,
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(
                            18.r,
                          ),
                          color: isSelected
                              ? AppColors.redPinkMain
                              : Colors.transparent,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.w,
                          ),
                          child: Text(
                            vm.categories[index].title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? AppColors.brownF9
                                  : AppColors.redPinkMain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
