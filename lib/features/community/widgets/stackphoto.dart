import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Stackphoto extends StatelessWidget {
  const Stackphoto({
    super.key,
    required this.photo,
  });

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          alignment: Alignment.topCenter,
          photo,
          width: 356.w,
          height: 173.h,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
