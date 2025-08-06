import 'package:day_36_darsda1/features/categories/managers/recipes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipesImage extends StatelessWidget {
  const RecipesImage({
    super.key, required this.photo,
  });
final String photo;
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesViewModel>(
      builder: (context, vm, child) {
        return Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(14),
            child: Image.network(
              photo,
              width: 169.w,
              height: 153.h,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
