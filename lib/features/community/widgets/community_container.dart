import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/community/widgets/container_profil_photo.dart';
import 'package:day_36_darsda1/features/community/widgets/name_rating.dart';
import 'package:day_36_darsda1/features/community/widgets/stackphoto.dart';
import 'package:day_36_darsda1/features/community/widgets/time_view_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CommunityContainer extends StatelessWidget {
  const CommunityContainer({
    required this.userId,
    super.key,
    required this.profilePhoto,
    required this.username,
    required this.photo,
    required this.title,
    required this.description,
    required this.rating,
    required this.timeRequired,
    required this.reviewsCount,
    required this.created,
    required this.id
  });

  final String profilePhoto, username, photo, title, description, created;
  final num rating;
  final int timeRequired;
  final int reviewsCount;
final int id,userId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 36.w, right: 36.w, bottom: 19.h),
      child: Column(
        spacing: 15.h,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => context.push('/chefProfile/$userId'),
            child: ContainerProfilePhoto(
              profilePhoto: profilePhoto,
              username: username,
              created: created,
            ),
          ),
          GestureDetector(
            onTap: () => context.push('/detail/$id?title=$title'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Column(
                children: [
                  Stackphoto(photo: photo),
                  Container(
                    width: 356.w,
                    constraints: BoxConstraints(minHeight: 77.h),
                    decoration: BoxDecoration(
                      color: AppColors.redPinkMain,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NameRating(
                            title: title,
                            rating: rating,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 258.31.w,
                                child: Text(
                                  description,
                                  style: AppStyles.tSW300S14Oq.copyWith(
                                    height: 1,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              Spacer(),
                              timeViewCount(
                                timeRequired: timeRequired,
                                reviewsCount: reviewsCount,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
