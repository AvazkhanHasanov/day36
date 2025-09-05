import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';



import '../../../core/utils/styles.dart';

class HomePageGestureDetector extends StatelessWidget {
  const HomePageGestureDetector({
    super.key,
    required this.photo,
    required this.name,
  });

  final String photo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.topChefs),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: Image.network(
              photo,
              width: 83.h,
              height: 74.h,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            name,
            style: AppStyles.subtext.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
