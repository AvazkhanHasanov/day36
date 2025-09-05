import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';

class followText extends StatelessWidget {
  const followText({
    super.key,
    required this.son,
    this.isFollowing = true,
  });

  final int son;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$son ${isFollowing ? 'following' : 'Followers'}',
      style: AppStyles.subtext.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
