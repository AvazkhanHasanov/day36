import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/add_recipes/widgets/ingredient_text_form_field.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddIngredient extends StatelessWidget {
  const AddIngredient({
    super.key,
    required this.nameController,
    required this.amountController,
    required this.onRemove,
  });

  final TextEditingController nameController;
  final TextEditingController amountController;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        spacing: 7.w,
        children: [
          SvgPicture.asset(AppIcons.threeDots),
          IngredientTextFormField(
            width: 70.w,
            hint: 'Amt',
            validator: (value) {},
            controller: amountController,
          ),
          IngredientTextFormField(
            width: 224.w,
            hint: 'Ingredient',
            validator: (value) {},
            controller: nameController,
          ),
          RecipesIconButton(
            icon: AppIcons.bin,
            onPressed: onRemove,
            size: Size(41.r, 41.r),
          ),
        ],
      ),
    );
  }
}
