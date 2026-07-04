class Salon {
  const Salon({
    required this.id,
    required this.name,
    required this.city,
    required this.rating,
    required this.services,
    required this.imageLabel,
  });

  final String id;
  final String name;
  final String city;
  final double rating;
  final List<String> services;
  final String imageLabel;

  factory Salon.fromJson(Map<String, dynamic> json) {
    return Salon(
      id: json['id'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      rating: (json['rating'] as num).toDouble(),
      services: List<String>.from(json['services'] as List<dynamic>),
      imageLabel: json['imageLabel'] as String? ?? 'Salon',
    );
  }
}
