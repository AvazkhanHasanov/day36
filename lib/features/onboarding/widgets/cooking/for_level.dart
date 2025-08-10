import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForLevel extends StatefulWidget {
  const ForLevel({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String title, description;
  final VoidCallback onTap;

  @override
  State<ForLevel> createState() => _ForLevelState();
}

final bool isSelected = false;

class _ForLevelState extends State<ForLevel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:17.w ),
        width: 365.w,
        height: 116.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(10.r),
          border: BoxBorder.all(
            color: isSelected ? AppColors.redPinkMain : AppColors.pink,
            width: 0.98.w,
          ),
        ),
        child: Column(

          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.brownF9,
              ),
            ),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.brownF9,
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
