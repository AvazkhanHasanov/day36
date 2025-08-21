import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/reviews/manages/recipes_review_view_model.dart';
import 'package:day_36_darsda1/features/reviews/widgets/reviews/about.dart';
import 'package:day_36_darsda1/features/reviews/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key , required this.id });
final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (context) => RecipesReviewViewModel(id: id, recipesRepo: context.read()),
        builder: (context, child) {
          return Consumer<RecipesReviewViewModel>(
            builder: (context, vm, child) {
              final review = vm.recipesReview!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    About(
                      id: review.id,
                      title: review.title,
                      profilePhoto: review.user.profilePhoto,
                      username: review.user.username,
                      firstName: review.user.firstName,
                      rating: review.rating,
                      reviewsCount: review.reviewsCount,
                      photo: review.photo,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 17.h, top: 27.h),
                            child: Text(
                              'Comments',
                              style: AppStyles.subtitle,
                            ),
                          ),
                          ...List.generate(
                            4,
                            (index) {
                              return Container(
                                width: 353.w,
                                constraints: BoxConstraints(minHeight: 152.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10.5.h,
                                  children: [
                                    Row(
                                      spacing: 13.w,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(17.5.r),
                                          child: Image.asset(
                                            'assets/image.png',
                                            height: 35.h,
                                            width: 35.w,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          '@r_joshua',
                                          style: AppStyles.tSW400S15Red,
                                        ),
                                        Spacer(),
                                        Text(
                                          '(15 mins ago)',
                                          style: AppStyles.tSW400S12,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fringilla eleifend purus vel dignissim. Praesent urna ante, iaculis at lobortis eu.',
                                      style: AppStyles.tSW300S12Oq,
                                      maxLines: 3,
                                    ),
                                    StarRating(
                                      rating: 3,
                                      spacing: 16,
                                      filledColor: AppColors.redPinkMain,
                                      emptyColor: AppColors.redPinkMain,
                                      starSize: 15.5,
                                    ),
                                    if (index != 1)
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 21.h),
                                        child: Divider(
                                          color: AppColors.redPinkMain,
                                          height: 1.h,
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
