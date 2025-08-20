import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_contaner.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/commet.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_review_sized_box.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_star.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/yes_or_no.dart';
import 'package:flutter/material.dart' hide Container;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({super.key});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Column(
          children: [
            CreateReviewSizedBox(
              text: 'Chicken Burger',
              photo: 'assets/image.png',
            ),
            SizedBox(height: 23.h),
            CreateStar(
              ratingChanging: (rating) {
                Text('Rating $rating');
              },
            ),
            Text(
              'Your overall rating',
              style: AppStyles.tSW400S12Oq,
            ),
            SizedBox(height: 28.h),
            Column(
              spacing: 10.h,
              children: [
                Commit(
                  controller: controller,
                ),
                Row(
                  spacing: 8.w,
                  children: [
                    RecipesIconButton(
                      size: Size(21, 21),
                      icon: AppIcons.add,
                      onPressed: () {},
                    ),
                    Text(
                      'Add Photo',
                      style: AppStyles.subtitleOq,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            YesOrNo(),
            SizedBox(height: 39.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreateContainer(
                  onTap: () {},
                  text: 'Cancel',
                  textStyle: AppStyles.subtitlePinkC,
                ),
                CreateContainer(
                  onTap: () {},
                  text: 'Submit',
                  textStyle: AppStyles.subtitleOq,
                  backgroundColor: AppColors.redPinkMain,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
