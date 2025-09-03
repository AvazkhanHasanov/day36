import 'package:day_36_darsda1/data/models/recipes/category_model.dart';
import 'package:day_36_darsda1/data/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoryRepository _categoryRepo;

  CategoriesViewModel({required CategoryRepository categoryRepo}) : _categoryRepo = categoryRepo {
    fetchCategories();
  }

  List<CategoriesModel> categories = [];
  int? selectedIndex;
  String? error;
  bool isLoading = true;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();
    final localData = await _categoryRepo.getLocal();
    if (localData.isNotEmpty) {
      categories = localData;
      notifyListeners();
    }

    var result = await _categoryRepo.getAll();
    result.fold(
      (exception) => error = exception.toString(),
      (value) => categories = value,
    );
    isLoading = false;
    notifyListeners();
  }
}
