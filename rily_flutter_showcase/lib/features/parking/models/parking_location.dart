class ParkingLocation {
  const ParkingLocation({
    required this.id,
    required this.name,
    required this.city,
    required this.availableSlots,
    required this.pricePerHour,
  });

  final String id;
  final String name;
  final String city;
  final int availableSlots;
  final double pricePerHour;

  factory ParkingLocation.fromJson(Map<String, dynamic> json) {
    return ParkingLocation(
      id: json['id'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      availableSlots: json['availableSlots'] as int,
      pricePerHour: (json['pricePerHour'] as num).toDouble(),
    );
  }
}
