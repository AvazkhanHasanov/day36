import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({
    super.key,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  final String profilePhoto;
  final String username, firstName, lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 9.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(61.5.r),
          child: Image.network(
            profilePhoto,
            width: 61.w,
            height: 63.h,
          ),
        ),

        SizedBox(
          height: 56.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@$username',
                style: AppStyles.subTextRed,
              ),
              Expanded(
                child: Text(
                  '$firstName $lastName',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.paragraph,

                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          alignment: Alignment.center,
          width: 109.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(
              21.82.r,
            ),
            color: AppColors.pink,
          ),
          child: Text(
            'Following',
            style: AppStyles.subtitle,
          ),
        ),
        RecipesIconButton(
          icon: AppIcons.threeDots,
          onPressed: () {},
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.redPinkMain,
        ),
      ],
    );
  }
}
