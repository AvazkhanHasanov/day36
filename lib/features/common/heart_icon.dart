import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/icons.dart';

class HeartIcon extends StatelessWidget {
  const HeartIcon({
    super.key,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  final Color foregroundColor, backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tight(Size(28, 28)),
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      icon: SvgPicture.asset(AppIcons.heart),
    );
  }
}
