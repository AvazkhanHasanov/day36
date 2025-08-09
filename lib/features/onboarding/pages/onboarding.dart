import 'package:day_36_darsda1/features/onboarding/pages/allergic_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/cooking_level_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/preferences_page.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/onboarding_page_app_bar.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
class _OnboardingPageState extends State<OnboardingPage> {
  final controller=PageController();
  final int currentPage=0;

  @override
void dispose(){
  super.dispose();
  controller.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingPageAppBar(currentState: 1),
      body: PageView(
        controller:controller,

        children: [
          CookingLevelPage(controller: controller,),
          PreferencesPage(controller: controller,),
          AllergicPage(controller: controller,),
        ],
      ),
    );
  }
}
