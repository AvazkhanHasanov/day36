import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:day_36_darsda1/features/community/managers/community_view_model.dart';
import 'package:day_36_darsda1/features/community/widgets/tab_bar_text.dart';
import 'package:day_36_darsda1/features/community/widgets/community_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(recipesRepo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: RecipeAppBar(title: 'Community'),
        body: Consumer<CommunityViewModel>(
          builder: (context, vm, child) {
            return vm.isCommunityLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TabBar(
                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          labelStyle: AppStyles.tSW400S15Oq,
                          indicatorColor: Colors.transparent,
                          indicatorAnimation: TabIndicatorAnimation.elastic,
                          controller: _controller,
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          tabs: [
                            Tab(
                              child: TabBarText(text: 'Top Recipes', isSelected: _controller.index == 0),
                            ),
                            Tab(
                              child: TabBarText(
                                text: 'Newest',
                                isSelected: _controller.index == 1,
                              ),
                            ),
                            Tab(
                              child: TabBarText(
                                text: 'Oldest',
                                isSelected: _controller.index == 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: TabBarView(
                          controller: _controller,
                          children: [
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return CommunityContainer(
                                  created: vm.data(vm.community[index].created),
                                  profilePhoto: vm.community[index].user.profilePhoto,
                                  username: vm.community[index].user.username,
                                  photo: vm.community[index].photo,
                                  title: vm.community[index].title,
                                  description: vm.community[index].description,
                                  rating: vm.community[index].rating,
                                  timeRequired: vm.community[index].timeRequired,
                                  reviewsCount: vm.community[index].reviewsCount,
                                );
                              },
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return CommunityContainer(
                                  created: vm.data(vm.newCommunity[index].created),
                                  profilePhoto: vm.newCommunity[index].user.profilePhoto,
                                  username: vm.newCommunity[index].user.username,
                                  photo: vm.newCommunity[index].photo,
                                  title: vm.newCommunity[index].title,
                                  description: vm.newCommunity[index].description,
                                  rating: vm.newCommunity[index].rating,
                                  timeRequired: vm.newCommunity[index].timeRequired,
                                  reviewsCount: vm.newCommunity[index].reviewsCount,
                                );
                              },
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return CommunityContainer(
                                  created: vm.data(vm.oldCommunity[index].created),
                                  profilePhoto: vm.oldCommunity[index].user.profilePhoto,
                                  username: vm.oldCommunity[index].user.username,
                                  photo: vm.oldCommunity[index].photo,
                                  title: vm.oldCommunity[index].title,
                                  description: vm.oldCommunity[index].description,
                                  rating: vm.oldCommunity[index].rating,
                                  timeRequired: vm.oldCommunity[index].timeRequired,
                                  reviewsCount: vm.oldCommunity[index].reviewsCount,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
