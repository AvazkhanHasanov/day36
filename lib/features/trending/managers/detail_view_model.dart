import 'package:flutter/cupertino.dart';
import '../../../data/models/recipes/detail_model.dart';

import '../../../data/repositories/detail_repository.dart';

class DetailIdViewModel extends ChangeNotifier {
  final DetailRepository _detailRepo;

  DetailIdViewModel({
    required DetailRepository detailRepo,
    required int detailId,
  }) : _detailRepo = detailRepo {
    fetchDetail(id: detailId);
  }

  bool isDetailLoading = false;
  String? detailError;
  DetailModel? recipes;

  Future<void> fetchDetail({required int id}) async {
    isDetailLoading = true;
    notifyListeners();
    var result = await _detailRepo.getById(id);
    result.fold(
          (exception) => detailError = exception.toString(),
          (value) => recipes = value,
    );
    isDetailLoading = false;
    notifyListeners();
  }
}
