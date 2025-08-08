import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';

class RecipesIconButton extends StatelessWidget {
  const RecipesIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.oq,
    this.foregroundColor = AppColors.oq,
  });

  final String icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      constraints: BoxConstraints.tight(
        Size(10, 10),
      ),
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
      ),
    );
  }
}
