import 'package:day_36_darsda1/data/repositories/top_chefs_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/top_chefs_model.dart';

class TopChefsViewModel extends ChangeNotifier {
  final TopChefsRepository _topChefsRepo;

  TopChefsViewModel({required TopChefsRepository topChefsRepo})
    : _topChefsRepo = topChefsRepo {
    fetchTopChefs();
  }

  List<List<TopChefsModel>> chefs = [];
  bool isLoading = false;
  String? error;
  int _page = 1;
  int _limit=2;

  Future<void> fetchTopChefs() async {
    isLoading = true;
    notifyListeners();
    var result = await _topChefsRepo.getAll(page: _page, limit: _limit);
    result.fold(
      (exception) => error = exception.toString(),
      (value)async {
        chefs.add(value);
        _page++;
        if (_page<=3) {
         await fetchTopChefs();
        }  
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
