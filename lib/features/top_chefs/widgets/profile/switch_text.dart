import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SwitchText extends StatefulWidget {
  SwitchText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<SwitchText> createState() => _SwitchTextState();
}

class _SwitchTextState extends State<SwitchText> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: AppStyles.tSW400S15,
        ),
        Switch(
          activeColor: AppColors.brownF9,
          activeTrackColor: AppColors.redPinkMain,
          inactiveThumbColor: AppColors.brownF9,
          inactiveTrackColor: AppColors.pink,
          trackOutlineColor: WidgetStateColor.transparent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isSelected,
          onChanged: (value) {
            isSelected = !isSelected;
            setState(() {});
          },
        ),
      ],
    );
  }
}
