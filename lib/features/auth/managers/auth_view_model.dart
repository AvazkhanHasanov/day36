import 'dart:async';

import 'package:day_36_darsda1/data/models/auth/auth_model.dart';
import 'package:day_36_darsda1/data/models/auth/login_model.dart';
import 'package:day_36_darsda1/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;
  String? error;
  String token = '';
  final AuthRepository _authRepo;

  AuthViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;

  Future<bool> registerEvent({
    required AuthModel authModel,
  }) async {
    isLoading = true;
    notifyListeners();
    final data = await _authRepo.add(authData: authModel);
    return data.fold(
      (e) {
        print('REGISTER ERROR: $e');
        isLoading = false;
        notifyListeners();
        return false;
      },
      (success) {
        isSuccess = true;
        token = success;
        isLoading = false;
        notifyListeners();
        return true;
      },
    );
  }

  //Loading uchun
  bool isLoginLoading = false;
  bool isLoginSuccess = false;
  String? loadingError;

  String loadingToken = '';

  Future<bool> loginEvent({required LoginModel loginModel}) async {
    isLoginLoading = true;
    notifyListeners();
    final loadingData = await _authRepo.login(loginData: loginModel);
    return loadingData.fold(
      (error) {
        print('xatolik chiqdiiiiiiiiiiiiiii: $error');
        print('dataType: $loadingData');

        isLoginLoading = false;
        notifyListeners();
        return false;
      },
      (success) {
        print('ishladi: $success');
        print('dataType: $loadingData');

        isLoginLoading = false;
        isLoginSuccess = true;
        loadingToken = success;
        notifyListeners();
        return true;
      },
    );
  }
}
