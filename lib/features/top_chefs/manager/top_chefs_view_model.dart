import 'package:flutter/cupertino.dart';

import '../../../data/models/top_chefs_model.dart';
import '../../../data/repositories/chef_repository.dart';

class TopChefsViewModel extends ChangeNotifier {
  final ChefRepository _chefRepo;

  TopChefsViewModel({required ChefRepository chefRepo})
    : _chefRepo = chefRepo {
    fetchTopChefs();
  }

  List<List<TopChefsModel>> chefs = [];
  bool isLoading = false;
  String? error;
  int _page = 1;
  final int _limit=2;



  Future<void> fetchTopChefs() async {
    isLoading = true;
    notifyListeners();
    var result = await _chefRepo.getAll(queryParams:{"Page": _page,"Limit":_limit});
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
