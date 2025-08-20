import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';

class RecipesIconButton extends StatelessWidget {
  const RecipesIconButton({
    this.padding=EdgeInsets.zero,
    this.size=const Size(10, 10),
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.pink,
    this.foregroundColor = AppColors.pinkSubC,
  });

  final String icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Size size;
final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tight(
        size,
      ),
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
      ),
    );
  }
}
