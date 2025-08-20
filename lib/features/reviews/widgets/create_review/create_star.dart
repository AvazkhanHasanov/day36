import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/icons.dart';

class CreateStar extends StatefulWidget {
  const CreateStar({
    this.ratingChanging,
    super.key,
  });
final void Function(int)? ratingChanging;
  @override
  State<CreateStar> createState() => _CreateStarState();
}

class _CreateStarState extends State<CreateStar> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6.w,
      children: [
        ...List.generate(
          5,
          (index) {
            final bool isFilled = index < rating;
            return GestureDetector(
              onTap: () {
                rating = index + 1;
                setState(() {});
                if (widget.ratingChanging!=null) {
                  widget.ratingChanging!(rating);
                }
              },
              child: SvgPicture.asset(
                isFilled ? AppIcons.star : AppIcons.starEmpty,
                width: 28.w,
                height: 28.h,
                colorFilter: ColorFilter.mode(
                  AppColors.redPinkMain,
                  BlendMode.srcIn,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
