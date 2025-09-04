import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/switch_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeDotBottomSheet extends StatefulWidget {
  const ThreeDotBottomSheet({
    super.key,
    required this.username,
    required this.profilePhoto,
  });

  final String username, profilePhoto;

  @override
  State<ThreeDotBottomSheet> createState() => _ThreeDotBottomSheetState();
}

class _ThreeDotBottomSheetState extends State<ThreeDotBottomSheet> {
  bool accountBlock = false;
  bool accountMute = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 431.w,
      height: 373.h,
      decoration: BoxDecoration(
        color: AppColors.brownF9,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 56.w,
          vertical: 45.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 15,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(31.r),
                  child: Image.network(
                    widget.profilePhoto,
                    width: 64.w,
                    height: 63.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '@${widget.username}',
                  style: AppStyles.subtitle,
                ),
              ],
            ),
            Text(
              'Manage notifications',
              style: AppStyles.tSW500S15Black,
            ),
            SwitchText(
              text: 'Mute notifications',
              textStyle: AppStyles.tSW400S15,
              value: notifications,
              onChanged: (value) => setState(() => notifications = value),
            ),
            SwitchText(
              text: 'Mute Account',
              textStyle: AppStyles.tSW400S15,
              value: accountMute,
              onChanged: (value) => setState(() => accountMute = value),
            ),
            SwitchText(
              text: 'Block Account',
              textStyle: AppStyles.tSW400S15,
              value: accountBlock,
              onChanged: (value) => setState(() => accountBlock = value),
            ),
          ],
        ),
      ),
    );
  }
}
