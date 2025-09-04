import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RecipeAppBarWithTitle extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarWithTitle({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Size get preferredSize => Size(double.infinity, 56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: RecipesIconButton(
        icon: AppIcons.backArrow,
        onPressed: () {
          context.pop();
        },
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.redPinkMain,
      ),
      centerTitle: true,
      title: Text(text),
    );
  }
}
