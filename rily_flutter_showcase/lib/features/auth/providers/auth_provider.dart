import 'package:flutter/foundation.dart';

import '../../../core/network/mock_api_client.dart';
import '../models/app_user.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this._apiClient);

  final MockApiClient _apiClient;

  AppUser? _user;
  bool _isLoading = false;
  String? _errorMessage;

  AppUser? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      _user = await _apiClient.login(email: email, password: password);
      return true;
    } catch (error) {
      _errorMessage = error.toString();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
