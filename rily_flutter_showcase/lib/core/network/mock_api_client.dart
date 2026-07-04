import '../../features/auth/models/app_user.dart';
import '../../features/beauty/models/salon.dart';
import '../../features/parking/models/parking_location.dart';
import '../../features/reservations/models/reservation.dart';

class MockApiClient {
  Future<AppUser> login({required String email, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));

    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw Exception('Email and password are required.');
    }

    return AppUser(
      id: 'u_001',
      name: 'Achraf Karzit',
      email: email,
      token: 'demo-token-2026',
    );
  }

  Future<List<Salon>> fetchSalons() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return const [
      Salon(
        id: 'salon_001',
        name: 'RiLy Beauty Studio',
        city: 'Casablanca',
        rating: 4.8,
        services: ['Haircut', 'Nails', 'Makeup', 'Facial'],
        imageLabel: 'Premium salon',
      ),
      Salon(
        id: 'salon_002',
        name: 'Glow Lab Maarif',
        city: 'Casablanca',
        rating: 4.6,
        services: ['Haircare', 'Massage', 'Skin care'],
        imageLabel: 'Beauty & wellness',
      ),
      Salon(
        id: 'salon_003',
        name: 'Urban Beauty Rabat',
        city: 'Rabat',
        rating: 4.7,
        services: ['Makeup', 'Nails', 'Brows'],
        imageLabel: 'Fast booking',
      ),
    ];
  }

  Future<List<ParkingLocation>> fetchParkings() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return const [
      ParkingLocation(
        id: 'parking_001',
        name: 'RiLyPark Maarif',
        city: 'Casablanca',
        availableSlots: 18,
        pricePerHour: 8,
      ),
      ParkingLocation(
        id: 'parking_002',
        name: 'RiLyPark Marina',
        city: 'Casablanca',
        availableSlots: 9,
        pricePerHour: 12,
      ),
      ParkingLocation(
        id: 'parking_003',
        name: 'RiLyPark Agdal',
        city: 'Rabat',
        availableSlots: 23,
        pricePerHour: 7,
      ),
    ];
  }

  Future<Reservation> createReservation({
    required String type,
    required String targetId,
    required String title,
    required DateTime date,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    return Reservation(
      id: 'res_${DateTime.now().millisecondsSinceEpoch}',
      type: type,
      targetId: targetId,
      title: title,
      date: date,
      status: ReservationStatus.confirmed,
    );
  }
}
