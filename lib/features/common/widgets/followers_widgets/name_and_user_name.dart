import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameAndUserName extends StatelessWidget {
  const NameAndUserName({
    super.key,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  final String username;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@$username',
            style: AppStyles.subtext.copyWith(color: AppColors.redPinkMain),
          ),
          Text(
            '$firstName $lastName',
            style: AppStyles.paragraph.copyWith(
              color: Theme.of(context).colorScheme.primary,
              height: 1,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
