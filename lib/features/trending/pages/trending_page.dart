import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:day_36_darsda1/features/trending/managers/trending_view_model.dart';
import 'package:day_36_darsda1/features/trending/pages/trending_page_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TrendingViewModel(trendingRepo: context.read()),
      builder: (context, child) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: RecipeAppBar(title: 'Trending Recipes'),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TrendingContainer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
