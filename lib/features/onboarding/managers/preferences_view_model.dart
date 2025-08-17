import 'package:day_36_darsda1/data/models/onboarding/preferences_model.dart';
import 'package:day_36_darsda1/data/repositories/preferences_repository.dart';
import 'package:flutter/material.dart';

class PreferencesViewModel extends ChangeNotifier {
  final PreferencesRepository _preferencesRepo;

  PreferencesViewModel({required PreferencesRepository preferencesRepo})
    : _preferencesRepo = preferencesRepo {
    fetchPreferences();
  }

  List<PreferenceModel> categories = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchPreferences() async {
    isLoading = true;
    notifyListeners();
    var result = await _preferencesRepo.getAll();
    result.fold(
      (exception) => error = exception.toString(),
      (value) => categories = value,
    );
    isLoading = false;
    notifyListeners();
  }
}
