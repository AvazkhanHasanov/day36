import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerOn extends StatelessWidget {
  const ContainerOn({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 207.w,
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(30.r),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: foregroundColor,
        ),
      ),
    );
  }
}
