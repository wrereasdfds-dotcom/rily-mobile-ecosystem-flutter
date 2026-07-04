import 'package:flutter/foundation.dart';

import '../../../core/network/mock_api_client.dart';
import '../models/salon.dart';

class BeautyProvider extends ChangeNotifier {
  BeautyProvider(this._apiClient);

  final MockApiClient _apiClient;

  bool _isLoading = false;
  String? _errorMessage;
  List<Salon> _salons = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Salon> get salons => _salons;

  Future<void> loadSalons() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _salons = await _apiClient.fetchSalons();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
