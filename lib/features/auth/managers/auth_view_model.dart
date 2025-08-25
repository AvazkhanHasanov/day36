import 'dart:async';

import 'package:day_36_darsda1/data/models/auth/auth_model.dart';
import 'package:day_36_darsda1/data/models/auth/login_model.dart';
import 'package:day_36_darsda1/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;
  String? error;

  final AuthRepository _authRepo;

  AuthViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;

  Future<bool> register({
    required AuthModel authModel,
  }) async {
    isLoading = true;
    notifyListeners();
    final result = await _authRepo.add(authData: authModel);
    return result.fold(
      (e) {
        isLoading = false;
        notifyListeners();
        return false;
      },
      (success) {
        isSuccess = true;
        isLoading = false;
        notifyListeners();
        return true;
      },
    );
  }

  //Login uchun
  bool isLoginLoading = false;
  bool isLoginSuccess = false;
  String? loadingError;

  Future<bool> loginEvent({required LoginModel loginModel}) async {
    isLoginLoading = true;
    notifyListeners();
    final loadingData = await _authRepo.login(loginData: loginModel);
    return loadingData.fold(
      (error) {
        isLoginLoading = false;
        notifyListeners();
        return false;
      },
      (success) {
        isLoginLoading = false;
        isLoginSuccess = true;
        notifyListeners();
        return true;
      },
    );
  }
}
