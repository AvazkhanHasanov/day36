import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class AddText extends StatelessWidget {
  const AddText({
    super.key,required this.text
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.subtitle.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
