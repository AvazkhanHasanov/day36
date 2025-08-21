import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/managers/detail_view_model.dart';
import 'package:day_36_darsda1/features/categories/widgets/detail_page/description.dart';
import 'package:day_36_darsda1/features/categories/widgets/detail_page_rich_text.dart';
import 'package:day_36_darsda1/features/categories/widgets/detail_profile.dart';
import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/detail_repository.dart';
import '../widgets/detail_page/detail_stack.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.title,
    required this.detailId,
  });

  final String title;
  final int detailId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailViewModel(
        detailRepo: context.read<DetailRepository>(),
        detailId: detailId,
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: RecipeAppBar(
            title: title,
          ),
          body: SingleChildScrollView(
            child: Consumer<DetailViewModel>(
              builder: (context, vm, child) {
                final detail = vm.detail;
                if (vm.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (vm.error != null) {
                  return Text(
                    vm.error!,
                    style: AppStyles.subtitleOq,
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // rasm va nomlari chiqadigan joy
                      DetailPageStack(
                        photo: detail!.photo,
                        title: detail.title,
                        rating: detail.rating,
                        id: detail.id,
                      ),
                      SizedBox(height: 26.h),
                      // Odamni profile qismi uchun rasm ismlari
                      DetailProfile(
                        profilePhoto: detail.user.profilePhoto,
                        username: detail.user.userName,
                        firstName: detail.user.firstName,
                        lastName: detail.user.lastName,
                      ),
                      //  Detail qismi uchun
                      Description(
                        timeRequired: detail.timeRequired,
                        description: detail.description,
                      ),
                      SizedBox(height: 31.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ingredients',
                            style: AppStyles.titlle,
                          ),
                          SizedBox(height: 26.h),
                          ...List.generate(
                            detail.ingredients.length,
                            (index) {
                              return DetailPageRichText(
                                text: detail.ingredients[index].name,
                                order: detail.ingredients[index].amount,
                              );
                            },
                          ),
                          SizedBox(height: 31.h),
                          Text(
                            '${detail.instructions.length} Easy Steps',
                            style: AppStyles.titlle,
                          ),
                          SizedBox(height: 11.h),
                          ...List.generate(
                            detail.instructions.length,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 11.h),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  ),
                                  width: 356.w,
                                  height: 81.h,
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0 ? AppColors.pinkSubC : AppColors.pink,
                                    borderRadius: BorderRadius.circular(14.r),
                                  ),
                                  child: Text(
                                    '${index + 1}. ${detail.instructions[index].text} ',
                                    style: AppStyles.subtextB,
                                    maxLines: 3,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
