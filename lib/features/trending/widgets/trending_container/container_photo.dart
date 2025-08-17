import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerPhoto extends StatelessWidget {
  const ContainerPhoto({
    super.key,
    required this.photo
  });
final String photo;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(
          photo,
          width: 358.w,
          height: 143.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
