import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/data/models/recipes/detail_model.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.timeRequired,
    required this.description,
  });

  final num timeRequired;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        Row(
          spacing: 7.w,
          children: [
            Text('Details', style: AppStyles.titlle),
            SizedBox(width: 8.w),
            RecipesIconButton(
              icon: AppIcons.clock,
              onPressed: () {},
              foregroundColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.transparent,
            ),
            Text(
              '$timeRequired min',
              style: AppStyles.subtext.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        Text(
          description,
          style: AppStyles.subtext.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
