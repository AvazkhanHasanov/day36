import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    super.key, required this.title,
  });
  final String title;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: AppStyles.appBarT,
      ),
      centerTitle: true,
    );
  }


}
