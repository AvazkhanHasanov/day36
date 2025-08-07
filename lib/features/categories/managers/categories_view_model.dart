import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/data/models/category/category_model.dart';
import 'package:flutter/material.dart';


class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel() {
    fetchCategories();
  }

  List<CategoriesModel> categories = [];
  int selectedIndex=0;

  bool isLoading = false;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();
    var respond = await dio.get('/categories/list');
    if (respond.statusCode != 200) {
      throw Exception('Xatolik: ${respond.data}');
    }
    categories = (respond.data as List)
        .map((x) => CategoriesModel.fromJson(x))
        .toList();
    isLoading = false;
    notifyListeners();
  }
}
