import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/add_recipes/widgets/add_image.dart';
import 'package:day_36_darsda1/features/add_recipes/widgets/add_ingredient.dart';
import 'package:day_36_darsda1/features/add_recipes/widgets/add_text.dart';
import 'package:day_36_darsda1/features/add_recipes/widgets/ingredient_text_form_field.dart';
import 'package:day_36_darsda1/features/auth/widgets/recipe_text_form_field.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/profile/widgets/text_button_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/styles.dart';
import '../../common/widgets/recipe_app_bar_with_title.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();
  final List<TextEditingController> nameController = [];
  final List<TextEditingController> amountController = [];
  final List<TextEditingController> instructionController = [];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    for (var value in instructionController) {
      value.dispose();
    }
    for (var value in nameController) {
      value.dispose();
    }
    for (var value in amountController) {
      value.dispose();
    }
    super.dispose();
  }

  void _addInstruction() {
    instructionController.add(TextEditingController());
    setState(() {});
  }

  void _addIngredient() {
    nameController.add(TextEditingController());
    amountController.add(TextEditingController());
    setState(() {});
  }

  void _removeInstruction(int index) {
    instructionController[index].dispose();
    instructionController.removeAt(index);
    setState(() {});
  }

  void _removeIngredient(int index) {
    nameController[index].dispose();
    amountController[index].dispose();
    nameController.removeAt(index);
    amountController.removeAt(index);
    setState(() {});
  }

  @override
  void initState() {
    _addInstruction();
    _addInstruction();
    _addInstruction();
    _addIngredient();
    _addIngredient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBarWithTitle(text: 'Create Recipes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 32.w, right: 32.w, bottom: 130.h),
          child: Column(
            spacing: 24.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonProfile(text: 'Publish', onPressed: () {}),
                  TextButtonProfile(text: 'Delete', onPressed: () {}),
                ],
              ),
              AddImage(),
              Form(
                child: Column(
                  spacing: 13.h,
                  children: [
                    RecipeTextFormField(
                      label: 'Title',
                      hint: 'Recipe title',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'joyni to`ldirshi shart';
                        }
                        return null;
                      },
                      controller: titleController,
                    ),
                    RecipeTextFormField(
                      label: 'Description',
                      hint: 'Recipe description',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'joyni to`ldirshi shart';
                        }
                        return null;
                      },
                      controller: descriptionController,
                    ),
                    RecipeTextFormField(
                      label: 'Time Recipe',
                      hint: '1hour,30min, ...',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'joyni to`ldirshi shart';
                        }
                        return null;
                      },
                      controller: timeController,
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  AddText(text: 'Ingredients'),
                  ...List.generate(
                    nameController.length,
                    (index) => AddIngredient(
                      nameController: nameController[index],
                      amountController: amountController[index],
                      onRemove: () => _removeIngredient(index),
                    ),
                  ),
                ],
              ),
              TextButtonProfile(
                text: '+ Add Ingredient',
                onPressed: () {
                  _addIngredient();
                },
                backgroundColor: AppColors.redPinkMain,
                textColor: AppColors.beige,
              ),
              AddText(text: 'Instructions'),
              Column(
                spacing: 10.h,
                children: [
                  ...List.generate(
                    instructionController.length,
                    (index) => Row(
                      spacing: 7.w,
                      children: [
                        SvgPicture.asset(AppIcons.threeDots),
                        IngredientTextFormField(
                          hintStyle: AppStyles.hintT,
                          hint: 'instructions 1',
                          validator: (value) {},
                          controller: instructionController[index],
                          width: 301.w,
                        ),
                        RecipesIconButton(
                          icon: AppIcons.bin,
                          size: Size(41.r, 41.r),
                          onPressed: () {
                            _removeInstruction(index);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TextButtonProfile(
                text: '+ Add Instruction',
                onPressed: () {
                  _addInstruction();
                },
                backgroundColor: AppColors.redPinkMain,
                textColor: AppColors.beige,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
