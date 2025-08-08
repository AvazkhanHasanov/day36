import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/data/models/onboarding/preferences_model.dart';
import 'package:flutter/material.dart';

class PreferencesViewModel extends ChangeNotifier {
  PreferencesViewModel(){
    fetchPreferences();
  }

  List<PreferenceModel> categories = [];
  bool isLoading = true;

  Future<void> fetchPreferences() async {
    isLoading = true;
    notifyListeners();
    var respond = await dio.get('/cuisines/list');
    if (respond.statusCode != 200) {
      throw Exception('cuisineslarni olib kelisihda hatolik ${respond.data}');
    } else {
      isLoading = false;
      categories = (respond.data as List)
          .map((x) => PreferenceModel.fromJson(x))
          .toList();
      notifyListeners();
    }
  }
}
