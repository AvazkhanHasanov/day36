import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/commet.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_review_sized_box.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_star.dart';
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
          style: AppStyles.subtextOq,
        ),
        Row(
          spacing: 100.w,
          children: [
            Row(
              children: [
                Text(
                  'No',
                  style: AppStyles.tSW300S15Oq,
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
                  style: AppStyles.tSW300S15Oq,
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
