import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerProfilePhoto extends StatelessWidget {
  const ContainerProfilePhoto({super.key, required this.profilePhoto, required this.username, required this.created});

  final String profilePhoto;
  final String username;
  final String created;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17.5.r),
          child: Image.network(
            profilePhoto,
            width: 35.w,
            height: 35.h,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@$username',
              style: AppStyles.subtitle.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              created,
              style: AppStyles.subtextPink,
            ),
          ],
        ),
      ],
    );
  }
}
