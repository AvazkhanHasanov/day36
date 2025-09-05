import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YesOrNo extends StatefulWidget {
  const YesOrNo({
    super.key,
  });

  @override
  State<YesOrNo> createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Do you recommend this recipe?',
          style: AppStyles.subtext.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        Row(
          spacing: 100.w,
          children: [
            Row(
              children: [
                Text(
                  'No',
                  style: AppStyles.subtitle.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Radio(
                  value: 1,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  fillColor: WidgetStatePropertyAll(Colors.pink),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  'Yes',
                  style: AppStyles.subtitle.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Radio(
                  value: 2,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  fillColor: WidgetStatePropertyAll(Colors.pink),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
