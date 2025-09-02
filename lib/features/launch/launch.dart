import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';

import '../../core/routing/routes.dart';

class Launch extends StatefulWidget {
  const Launch({super.key});

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  Future<bool> isRegistered() async {
    final preference = FlutterSecureStorage();
    if (await preference.read(key: 'Zebra') != null) {
      return true;
    } else {
      return false;
    }
  }

  // @override
  // void initState() {
  //   isRegistered().then((value) async {
  //     await Future.delayed(Duration(seconds: 4));
  //     if (value) {
  //       context.go(RouteName.categoriesPage);
  //     } else {
  //       context.go(RouteName.login);
  //     }
  //   });
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        context.push(Routes.categoriesPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redPinkMain,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img.png',
              width: 153.w,
              height: 153.h,
            ),
            Text(
              'DishDash',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 63.84.sp,
                color: AppColors.brownF9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
