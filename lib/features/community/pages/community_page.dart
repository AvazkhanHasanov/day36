import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:day_36_darsda1/features/community/managers/community_view_model.dart';
import 'package:day_36_darsda1/features/community/widgets/community_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommunityPage extends StatelessWidget  {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(recipesRepo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: RecipeAppBar(title: 'Community'),
        body: SingleChildScrollView(
          child: Consumer<CommunityViewModel>(
            builder: (context, vm, child) {
              return vm.isCommunityLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        TabBar(
                          tabs: [
                            
                            Tab(
                              child: Text('d'),
                            ),
                          ],
                        ),
                        TabBarView(children: []),

                        ...List.generate(
                          vm.community.length,
                          (index) {
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
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
