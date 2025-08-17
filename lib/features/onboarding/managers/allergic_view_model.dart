import 'package:day_36_darsda1/data/models/onboarding/allergic_model.dart';
import 'package:day_36_darsda1/data/repositories/allergic_repository.dart';
import 'package:flutter/material.dart';

class AllergicViewModel extends ChangeNotifier {
  final AllergicRepository _allergicRepo;

  AllergicViewModel({required AllergicRepository allergicRepo})
    : _allergicRepo = allergicRepo {
    fetchAllergic();
  }

  List<AllergicModel> categories = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchAllergic() async {
    isLoading = true;
    notifyListeners();
    var result = await _allergicRepo.getAll();
    result.fold(
      (exception) => error = exception.toString(),
      (value) => categories = value,
    );
    isLoading = false;
    notifyListeners();
  }
}
