import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/add_recipes/widgets/ingredient_text_form_field.dart';
import 'package:day_36_darsda1/features/common/widgets/followers_widgets/following_info.dart';
import 'package:day_36_darsda1/features/common/widgets/followers_widgets/follow_text.dart';
import 'package:day_36_darsda1/features/common/widgets/recipe_app_bar_with_title.dart';
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
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
    {
      'image': 'assets/img.png',
      'username': 'khan',
      'firstName': "Avazkhan",
      'lastName': 'Khasanov',
    },
  ];

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    // _controller.addListener(() => setState(() {}));
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
                  SingleChildScrollView(
                    child: Column(
                      spacing: 15.h,
                      children: [
                        IngredientTextFormField(
                          hintStyle: AppStyles.subtext.copyWith(
                            color: AppColors.redPinkMain,
                          ),
                          hint: 'Search',
                          controller: controllerFollowing,
                          width: double.infinity,
                        ),
                        ...List.generate(
                          myList.length,
                          (index) {
                            return FollowingInfo(
                              profilePhoto: myList[index]['image'],
                              username: myList[index]['username'],
                              firstName: myList[index]['firstName'],
                              lastName: myList[index]['lastName'],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      spacing: 9.h,
                      children: [
                        IngredientTextFormField(
                          hintStyle: AppStyles.subtext.copyWith(color: AppColors.redPinkMain),
                          hint: 'Search',
                          controller: controllerFollowers,
                          width: double.infinity,
                        ),
                        ...List.generate(
                          myList.length,
                          (index) {
                            return Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    myList[index]['image'],
                                    width: 61.w,
                                    height: 63.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '@${myList[index]['username']}',
                                        style: AppStyles.subtext.copyWith(color: AppColors.redPinkMain),
                                      ),
                                      Text(
                                        '${myList[index]['firstName']} ${myList[index]['lastName']}',
                                        style: AppStyles.paragraph.copyWith(
                                          color: Theme.of(context).colorScheme.primary,
                                          height: 1,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
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
