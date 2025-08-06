import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
    required this.image,
    required this.title,
    required this.categoryId,
  });

  final int categoryId;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => context.push('/recipes/$categoryId'),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12.r),
              child: Image.network(
                image,
                width: 158.w,
                height: 144.h,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.brownF9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
