import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/add_recipes/widgets/ingredient_text_form_field.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/widgets/followers_widgets/follow_text.dart';
import 'package:day_36_darsda1/features/common/widgets/recipe_app_bar_with_title.dart';
import 'package:day_36_darsda1/features/profile/widgets/text_button_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({super.key});

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  final int son = 120;
  final controllerFollowing = TextEditingController();
  final controllerFollowers = TextEditingController();
  final List<Map<String, dynamic>> myList = [
    {
      'image': 'assets/img.png',
      'nickname': 'khan',
      'Firstname': "Avazkhan",
      'secondName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'nickname': 'khan',
      'Firstname': "Avazkhan",
      'secondName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'nickname': 'khan',
      'Firstname': "Avazkhan",
      'secondName': 'Khasanov',
    },
  ];

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    controllerFollowing.dispose();
    controllerFollowers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBarWithTitle(text: "@Khan", centerTitle: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Column(
          spacing: 8.h,
          children: [
            TabBar(
              controller: _controller,
              dividerColor: Colors.transparent,
              indicatorAnimation: TabIndicatorAnimation.elastic,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.redPinkMain,
              tabs: [
                Tab(child: followText(son: son)),
                Tab(child: followText(son: son, isFollowing: false)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  Column(
                    spacing: 9.h,
                    children: [
                      IngredientTextFormField(
                        hintStyle: AppStyles.subtext.copyWith(color: AppColors.redPinkMain),
                        hint: 'Search',
                        controller: controllerFollowing,
                        width: double.infinity,
                      ),
                    ],
                  ),
                  Column(
                    spacing: 9.h,
                    children: [
                      IngredientTextFormField(
                        hintStyle: AppStyles.subtext.copyWith(color: AppColors.redPinkMain),
                        hint: 'Search',
                        controller: controllerFollowers,
                        width: double.infinity,
                      ),
                      Row(
                        spacing: 15.w,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/image.png',
                              width: 61.w,
                              height: 63.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@khan',
                                style: AppStyles.subtext.copyWith(color: AppColors.redPinkMain),
                              ),
                              Text('Avazkhan'),
                            ],
                          ),
                          Spacer(),
                          TextButtonProfile(
                            text: 'following',
                            onPressed: () {},
                            width: 109,
                          ),
                          RecipesIconButton(
                            icon: AppIcons.threeDots,
                            onPressed: () {},
                            backgroundColor: Colors.transparent,
                            foregroundColor: AppColors.redPinkMain,
                            size: Size(20.r, 20.r),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
