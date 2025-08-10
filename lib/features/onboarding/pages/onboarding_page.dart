import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:day_36_darsda1/features/onboarding/managers/onboarding_view_model.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/o_b2.dart';
import 'package:day_36_darsda1/features/onboarding/pages/onboarding1_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesViewModel(),
        ),
      ],
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.backArrow),
          ),
        ),
        body: Consumer<OnboardingViewModel>(
          builder: (context, vm, child) {
            return PageView.builder(
              controller: controller,
              itemCount: vm.onboarding.length +1,
              itemBuilder: (context, index) {
                if (index < vm.onboarding.length) {
                  if (vm.onboarding.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Onboarding1(
                      text: vm.onboarding[index].title,
                      subText: vm.onboarding[index].subtitle,
                      photo: vm.onboarding[index].image,
                      onTap: () {
                        controller.animateToPage(
                          index + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                    );
                  }
                } else {
                  return OB2();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
