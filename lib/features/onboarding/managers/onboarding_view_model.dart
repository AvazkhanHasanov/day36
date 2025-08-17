import 'package:day_36_darsda1/data/models/onboarding/onboarding_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/category/category_model.dart';
import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  final OnboardingRepository _onboardingRepo;
  final CategoryRepository _categoryRepo;

  OnboardingViewModel({
    required OnboardingRepository onboardingRepo,
    required CategoryRepository categoryRepo,
  }) : _onboardingRepo = onboardingRepo,
       _categoryRepo = categoryRepo {
    fetchOnboarding();
    fetchCategories();
  }

  List<OnboardingModel> onboarding = [];
  String? error;

  bool isLoading = true;

  Future<void> fetchOnboarding() async {
    isLoading = true;
    notifyListeners();
    var result = await _onboardingRepo.getAll();
    result.fold(
      (exception) => error = exception.toString(),
      (value) => onboarding = value,
    );
    isLoading = false;
    notifyListeners();
  }

  //
  List<CategoriesModel> categories = [];
  String? categoriesError;

  bool isCategoriesLoading = false;

  Future<void> fetchCategories() async {
    isCategoriesLoading = true;
    notifyListeners();
    var result = await _categoryRepo.getAll();
    result.fold(
      (exception) => categoriesError = exception.toString(),
      (value) => categories = value,
    );

    isCategoriesLoading = false;
    notifyListeners();
  }
}
