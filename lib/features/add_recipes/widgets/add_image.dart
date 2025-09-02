import 'dart:io';

import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/managers/image_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageViewModel>(
      builder: (context, vm, child) => GestureDetector(
        onTap: () {
          context.read<ImageViewModel>().selectedImage(true);
          // context.pop();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 362.w,
              height: 281.h,
              decoration: BoxDecoration(
                color: AppColors.pink.withAlpha((255 / 2).toInt()),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: vm.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : (vm.selectedImagePath == null)
                  ? Center(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 12.w),
                              child: Row(
                                spacing: 14.w,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        context.read<ImageViewModel>().selectedImage(false);
                                        context.pop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.r),
                                          color: Colors.grey.withAlpha(100),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.photo_camera, color: Colors.blue, size: 35),
                                            SizedBox(height: 8),
                                            Text("Camera"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        context.read<ImageViewModel>().selectedImage(true);
                                        context.pop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.r),
                                          color: Colors.grey.withAlpha(100),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.image, color: Colors.blue, size: 35),
                                            SizedBox(height: 8),
                                            Text("Gallery"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Image.file(
                      File(vm.selectedImagePath!),
                      fit: BoxFit.cover,
                    ),
            ),
            Column(
              spacing: 15.h,
              children: [
                RecipesIconButton(
                  size: Size(74.w, 71.h),
                  backgroundColor: AppColors.redPinkMain,
                  foregroundColor: AppColors.brownF9,
                  icon: AppIcons.play,
                  onPressed: () {},
                ),
                if (vm.selectedImagePath == null)
                  Text(
                    'Add video recipe',
                    style: AppStyles.tSW500.copyWith(fontSize: 13.sp),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
