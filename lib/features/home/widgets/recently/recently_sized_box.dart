import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';
import '../../../common/heart_icon.dart';

class RecentlySizedBox extends StatefulWidget {
  const RecentlySizedBox({
    super.key,
    required this.title,
    this.photo,
    required this.rating,
    required this.timeRequired,
  });

  final String title;
  final photo;
  final num rating;
  final int timeRequired;

  @override
  State<RecentlySizedBox> createState() => _RecentlySizedBoxState();
}

class _RecentlySizedBoxState extends State<RecentlySizedBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169.w,
      height: 226.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 159.w,
              height: 77.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(14.r),
                ),
                border: BoxBorder.fromLTRB(
                  left: BorderSide(
                    width: 1,
                    color: AppColors.pinkSubC,
                  ),
                  right: BorderSide(
                    width: 1,
                    color: AppColors.pinkSubC,
                  ),
                  bottom: BorderSide(
                    width: 1,
                    color: AppColors.pinkSubC,
                  ),
                ),
                color: AppColors.brownF9,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: AppStyles.subtext23,
                    ),
                    Text(
                      'Acidic and refreshing',
                      maxLines: 1,
                      style: AppStyles.subTextMini,
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          '${widget.rating}',
                          style: AppStyles.subtextPink,
                        ),
                        SvgPicture.asset(
                          AppIcons.star,
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          AppIcons.clock,
                        ),
                        Text(
                          '${widget.timeRequired}min',
                          style: AppStyles.subtextPink,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.network(
              widget.photo,
              width: 169.w,
              height: 153.h,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 7,
            right: 8,
            child: HeartIcon(
              foregroundColor: isSelected ? AppColors.brownF9 : AppColors.pink,
              backgroundColor: isSelected
                  ? AppColors.redPinkMain
                  : AppColors.pinkSubC,
              onPressed: () {
                isSelected = !isSelected;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
