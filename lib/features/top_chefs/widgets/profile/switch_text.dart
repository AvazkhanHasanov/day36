import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SwitchText extends StatelessWidget {
  const SwitchText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final TextStyle textStyle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        Switch(
          activeColor: AppColors.brownF9,
          activeTrackColor: AppColors.redPinkMain,
          inactiveThumbColor: AppColors.brownF9,
          inactiveTrackColor: AppColors.pink,
          trackOutlineColor: WidgetStateColor.transparent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
