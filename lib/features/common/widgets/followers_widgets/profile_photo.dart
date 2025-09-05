import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.profilePhoto,
  });

  final String profilePhoto;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        profilePhoto,
        width: 61.w,
        height: 63.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
