import 'package:flutter/foundation.dart';

import '../../../core/network/mock_api_client.dart';
import '../models/parking_location.dart';

class ParkingProvider extends ChangeNotifier {
  ParkingProvider(this._apiClient);

  final MockApiClient _apiClient;

  bool _isLoading = false;
  String? _errorMessage;
  List<ParkingLocation> _parkings = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<ParkingLocation> get parkings => _parkings;

  Future<void> loadParkings() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _parkings = await _apiClient.fetchParkings();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
