import 'package:flutter/foundation.dart';

import '../../../core/network/mock_api_client.dart';
import '../models/reservation.dart';

class ReservationProvider extends ChangeNotifier {
  ReservationProvider(this._apiClient);

  final MockApiClient _apiClient;

  bool _isLoading = false;
  String? _errorMessage;
  final List<Reservation> _reservations = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Reservation> get reservations => List.unmodifiable(_reservations);

  Future<void> createReservation({
    required String type,
    required String targetId,
    required String title,
    required DateTime date,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final reservation = await _apiClient.createReservation(
        type: type,
        targetId: targetId,
        title: title,
        date: date,
      );
      _reservations.insert(0, reservation);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
