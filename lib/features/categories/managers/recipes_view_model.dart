import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/data/models/category/recipes_model.dart';
import 'package:flutter/material.dart';

class RecipesViewModel extends ChangeNotifier {
  RecipesViewModel({required this.categoryId}) {
    fetchCategories();
  }

  final int categoryId;
  List<RecipesModel> elements = [];
  bool isLoading = false;

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();
    var respond = await dio.get('/recipes/list?Category=$categoryId');
    if (respond.statusCode != 200) {
      throw Exception('Xatolik: ${respond.data}');
    } else {
      isLoading = false;
      elements = (respond.data as List)
          .map((x) => RecipesModel.fromJson(x))
          .toList();

      notifyListeners();
    }
  }
}
