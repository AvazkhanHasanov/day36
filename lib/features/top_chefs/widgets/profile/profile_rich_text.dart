import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileRichText extends StatelessWidget {
  const ProfileRichText({
    super.key, required this.number, required this.text,
  });
final int number;
final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$number',style: AppStyles.subtitleOq.copyWith(height: 1),),
        Text(text,style: AppStyles.subtextOq.copyWith(height: 1),),
      ],
    );
  }
}
