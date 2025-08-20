import 'package:day_36_darsda1/data/models/recipes/detail_model.dart';
import 'package:day_36_darsda1/data/repositories/detail_repository.dart';
import 'package:flutter/material.dart';

class DetailViewModel extends ChangeNotifier {
  final DetailRepository _detailRepo;

  DetailViewModel({required int detailId, required DetailRepository detailRepo})
    : _detailRepo = detailRepo{
    fetchDetail(detailId: detailId);
  }
  String? error;
  DetailModel? detail;
  bool isLoading = false;

  Future<void> fetchDetail({required int detailId}) async {
    isLoading = true;
    notifyListeners();
    final result = await _detailRepo.getById(detailId);
    result.fold((e) => error = e.toString(), (value) => detail = value);
    isLoading = false;
    notifyListeners();
  }
}
