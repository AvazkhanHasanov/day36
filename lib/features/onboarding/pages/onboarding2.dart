import 'package:day_36_darsda1/features/onboarding/widgets/allergic/allergic.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/cooking/cooking_level.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/preference/preferences.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/onboarding_page_app_bar.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}
class _Onboarding2State extends State<Onboarding2> {
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
          CookingLevel(controller: controller,),
          Preferences(controller: controller,),
          Allergic(controller: controller,),
        ],
      ),
    );
  }
}
