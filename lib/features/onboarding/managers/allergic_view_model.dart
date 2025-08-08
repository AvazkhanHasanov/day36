import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/data/models/onboarding/allergic_model.dart';
import 'package:day_36_darsda1/data/models/onboarding/preferences_model.dart';
import 'package:flutter/material.dart';

class AllergicViewModel extends ChangeNotifier {
  AllergicViewModel(){
    fetchAllergic();
  }

  List<AllergicModel> categories = [];
  bool isLoading = true;

  Future<void> fetchAllergic() async {
    isLoading = true;
    notifyListeners();
    var respond = await dio.get('/allergic/list');
    if (respond.statusCode != 200) {
      throw Exception('cuisineslarni olib kelisihda hatolik ${respond.data}');
    } else {
      isLoading = false;
      categories = (respond.data as List)
          .map((x) => AllergicModel.fromJson(x))
          .toList();
      notifyListeners();
    }
  }
}
