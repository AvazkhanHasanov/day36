import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailPageRichText extends StatelessWidget {
  const DetailPageRichText({
    super.key,
    required this.text,
    required this.order,
  });

  final String text;
  final int? order;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '• ${order??""} ',
        style: AppStyles.subTextRed,
        children: [
          TextSpan(
            text: text,
            style: AppStyles.subTextOq,
          ),
        ],
      ),
    );
  }
}
