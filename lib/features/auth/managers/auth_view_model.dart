import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/data/models/auth/auth_model.dart';
import 'package:day_36_darsda1/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  String token = '';

  void registerEvent({
    required AuthModel authModel,
    required VoidCallback onError,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    final data = await AuthRepository(
      client: ApiClient(),
    ).register(authData: authModel);
    data.fold(
      (e) {
        onError();
      },
      (success) {
        token = success;
        onSuccess();
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
