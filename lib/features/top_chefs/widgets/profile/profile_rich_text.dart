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
    return RichText(
      text: TextSpan(
        text: '$number',
        style: AppStyles.subtitleOq,
        children: [
          TextSpan(
            text: '\n$text',
            style: AppStyles.subtextOq,
          ),
        ],
      ),
    );
  }
}
