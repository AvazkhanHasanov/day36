import 'package:day_36_darsda1/data/repositories/recipes_repository.dart';
import 'package:flutter/material.dart';

import '../../../data/models/recipes/community_model.dart';

class CommunityViewModel extends ChangeNotifier {
  final RecipesRepository _recipesRepo;

  CommunityViewModel({required RecipesRepository recipesRepo}) : _recipesRepo = recipesRepo {
    fetchCommunity();
    fetchNewCommunity();
    fetchOldCommunity();
  }

  bool isCommunityLoading = false;
  String? communityError;
  List<CommunityModel> community = [];

  Future<void> fetchCommunity() async {
    isCommunityLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getCommunity();
    result.fold(
      (exception) {
        return communityError = exception.toString();
      },
      (value) {
        return community = value;
      },
    );
    isCommunityLoading = false;
    notifyListeners();
  }
  //New
  bool isNewCommunityLoading = false;
  String? newCommunityError;
  List<CommunityModel> newCommunity = [];

  Future<void> fetchNewCommunity() async {
    isNewCommunityLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getCommunity(queryParam: {'Order':'created'});
    result.fold(
      (exception) {
        return newCommunityError = exception.toString();
      },
      (value) {
        return newCommunity = value;
      },
    );
    isNewCommunityLoading = false;
    notifyListeners();
  }
// Old
  bool isOldCommunityLoading = false;
  String? oldCommunityError;
  List<CommunityModel> oldCommunity = [];

  Future<void> fetchOldCommunity() async {
    isOldCommunityLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getCommunity(queryParam: {'Descending':'true'});
    result.fold(
      (exception) {
        return oldCommunityError = exception.toString();
      },
      (value) {
        return oldCommunity = value;
      },
    );
    isOldCommunityLoading = false;
    notifyListeners();
  }













  String data(DateTime created) {
    DateTime now = DateTime.now();
    Duration time = now.difference(created);
    if (time.inDays >= 365) {
      var result = time.inDays ~/ 365;
      return '$result yil oldin ';
    } else {
      if (time.inDays >= 30) {
        var result = (time.inDays) ~/ 30;
        return '$result oy oldin ';
      } else if (time.inDays >= 7) {
        var result = time.inDays ~/ 7;
        return '$result hafta oldin ';
      } else if (time.inDays >= 1) {
        return '${time.inDays} kun oldin ';
      } else if (time.inHours >= 1) {
        var result = time.inHours;
        return '$result soat oldin ';
      } else {
        return 'Hozirgina ';
      }
    }
  }
}
