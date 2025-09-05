import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailPageRichText extends StatelessWidget {
  const DetailPageRichText({
    super.key,
    required this.text,
    required this.order,
  });

  final String text;
  final String order;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '• $order ',
        style: AppStyles.subtextRed,
        children: [
          TextSpan(
            text: text,
            style: AppStyles.subtext.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
