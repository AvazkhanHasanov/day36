import 'package:day_36_darsda1/data/models/trending_model.dart';
import 'package:day_36_darsda1/data/repositories/trending_repository.dart';
import 'package:flutter/material.dart';

class TrendingViewModel extends ChangeNotifier {
  final TrendingRepository _trendingRepo;

  TrendingViewModel({required TrendingRepository trendingRepo})
    : _trendingRepo = trendingRepo {
    fetchTrending();
  }

  TrendingModel? trending;

  bool isTrendingLoading = true;
  String? error;

  Future<void> fetchTrending() async {
    isTrendingLoading = true;
    notifyListeners();
    var result = await _trendingRepo.getOne();
    print('Treding $result');

    result.fold(
      (exception) => error = exception.toString(),
      (value) => trending = value,
    );
    print('error$error');
    isTrendingLoading = false;
    notifyListeners();
  }
}
