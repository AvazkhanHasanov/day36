import 'package:day_36_darsda1/core/routing/routes.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
    required this.profilePhoto,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.presentation,
  });

  final String profilePhoto, firstName, lastName, username, presentation;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 13.w,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(46.r),
          child: Image.network(
            profilePhoto,
            width: 102,
            height: 97,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$firstName $lastName',
                    style: AppStyles.subtitle,
                  ),
                  Text(
                    '@$username',
                    style: AppStyles.subtext.copyWith(color: AppColors.pinkSubC),
                  ),
                  SizedBox(
                    width: 163.w,
                    child: Text(
                      presentation,
                      style: AppStyles.subtext.copyWith(color: AppColors.pinkSubC),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Row(
                  spacing: 5.w,
                  children: [
                    RecipesIconButton(
                      icon: AppIcons.add,
                      onPressed: () {},
                      size: Size(28, 28),
                    ),
                    RecipesIconButton(
                      icon: AppIcons.burgerBar,
                      onPressed: () {
                        context.push(Routes.setting);
                      },
                      size: Size(28, 28),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
