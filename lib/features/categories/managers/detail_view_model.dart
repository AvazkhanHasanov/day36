import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/data/models/category/detail_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class DetailViewModel extends ChangeNotifier {
  DetailViewModel({required int detailId}) {
    fetchDetail(detailId: detailId);
  }

  List<DetailModel> ingredients = [];
  DetailModel? detail;
  bool isLoading = false;

  Future<void> fetchDetail({required int detailId}) async {
    isLoading = true;
    notifyListeners();
    try {
      log('So‘rov ketdi: detailId = $detailId');
      var respond = await dio.get('/recipes/detail/$detailId');

      log('Javob status: ${respond.statusCode}');
      log('Javob data: ${respond.data}');
      if (respond.statusCode != 200) {
        throw Exception('detaillarni olib kelishda xatolik ${respond.data}');
      } else {

        detail = DetailModel.fromJson(respond.data);
      }
    } catch (e) {
      log('xatolik: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
