import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TabText extends StatelessWidget {
  const TabText({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.subtext.copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }
}
