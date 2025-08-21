import 'package:day_36_darsda1/core/route/route_name.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/reviews/manages/create_review_view_model.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_contaner.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/commet.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_review_sized_box.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/create_star.dart';
import 'package:day_36_darsda1/features/reviews/widgets/create_review/yes_or_no.dart';
import 'package:flutter/material.dart' hide Container;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({super.key, required this.id});

  final int id;

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
      body: ChangeNotifierProvider(
        create: (context) => CreateReviewViewModel(id: widget.id, recipesRepo: context.read()),
        builder: (context, child) {
          return Consumer<CreateReviewViewModel>(
            builder: (context, vm, child) {
              return (vm.isCreateReviewLoading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 37.w),
                        child: Column(
                          children: [
                            CreateReviewSizedBox(
                              text: vm.createdReview!.comment,
                              photo: vm.createdReview!.image,
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
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          titleTextStyle: AppStyles.tSW600S20Black,
                                          titlePadding: EdgeInsets.only(left: 48.w, right: 48.w, top: 46.h),
                                          title: Text(
                                            'Thank you for your Review!',
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 48.w),
                                            child: Column(
                                              spacing: 20.h,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(AppIcons.bigTick),
                                                Text(
                                                  'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.',
                                                  style: AppStyles.tSW400S13Black,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                          actionsAlignment: MainAxisAlignment.center,
                                          alignment: Alignment.center,
                                          actions: [
                                            CreateContainer(
                                              onTap: () {
                                                context.go(RouteName.home);
                                              },
                                              width: 207,
                                              height: 45,
                                              textStyle: AppStyles.tSW600S20Oq,
                                              text: 'Go To Home',
                                              backgroundColor: AppColors.redPinkMain,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  text: 'Submit',
                                  textStyle: AppStyles.subtitleOq,
                                  backgroundColor: AppColors.redPinkMain,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            },
          );
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
