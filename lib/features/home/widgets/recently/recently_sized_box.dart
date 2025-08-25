import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';
import '../../../common/widgets/heart_icon.dart';

class RecentlySizedBox extends StatefulWidget {
  const RecentlySizedBox({
    super.key,
    required this.title,
    required this.photo,
    required this.rating,
    required this.timeRequired,
    required this.description,
    required this.id
  });

  final String title,description;
  final String photo;
  final num rating;
  final int timeRequired,id;


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
      child: GestureDetector(
        onTap: () => context.push('/detail/${widget.id}?title=${widget.title}'),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
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
                  padding: EdgeInsets.only(left:  15.w,right: 15.w,bottom: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        style: AppStyles.subtext23,
                      ),
                      Text(
                        widget.description,
                        maxLines: 1,
                        style: AppStyles.subTextMini,
                      ),
                      SizedBox(height: 8.h),
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
      ),
    );
  }
}
