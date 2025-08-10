
import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/data/models/onboarding/onboarding_model.dart';
import 'package:flutter/cupertino.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel(){
    fetchOnboarding();
  }
  List<OnboardingModel> onboarding = [];
  bool isLoading = true;

  Future<void> fetchOnboarding() async {
    isLoading = true;
    notifyListeners();
    var respond = await dio.get('/onboarding/list');
    if (respond.statusCode != 200) {
      throw Exception('xatolik');
    } else {
      isLoading = false;

      onboarding = (respond.data as List)
          .map((x) => OnboardingModel.fromJson(x))
          .toList();
      notifyListeners();
    }
  }
}
