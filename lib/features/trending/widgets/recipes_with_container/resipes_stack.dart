import 'package:day_36_darsda1/features/trending/widgets/recipes_with_container/stack_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RecipesStack extends StatelessWidget {
  const RecipesStack({
    super.key,

    required this.title,
    required this.description,
    required this.timeRequired,
    required this.rating,
    required this.photo,
    required this.id
  });

  final String title, description, photo;
  final int timeRequired;
  final num rating;
  final int id;
final String appTitle='Trending Recipes';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () {
           context.push('/detail/$id?title=$appTitle');
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  photo,
                  width: 151.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: StackContainer(
                title: title,
                description: description,
                timeRequired: timeRequired,
                rating: rating,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
