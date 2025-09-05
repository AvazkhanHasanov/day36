import 'package:day_36_darsda1/core/utils/styles.dart';
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
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token != null && token.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    isRegistered().then((value) async {
      await Future.delayed(Duration(seconds: 4));
      if (value) {
        context.go(Routes.home);
      } else {
        context.go(Routes.login);
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
              'assets/img2.png',
              width: 153.w,
              height: 153.h,
            ),
            Text('DishDash', style: AppStyles.tSW600S20Oq.copyWith(fontSize: 63.84.sp)),
          ],
        ),
      ),
    );
  }
}
