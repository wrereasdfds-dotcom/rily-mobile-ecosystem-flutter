enum ReservationStatus { pending, confirmed, cancelled }

class Reservation {
  const Reservation({
    required this.id,
    required this.type,
    required this.targetId,
    required this.title,
    required this.date,
    required this.status,
  });

  final String id;
  final String type;
  final String targetId;
  final String title;
  final DateTime date;
  final ReservationStatus status;

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as String,
      type: json['type'] as String,
      targetId: json['targetId'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      status: ReservationStatus.values.firstWhere(
        (status) => status.name == json['status'],
        orElse: () => ReservationStatus.pending,
      ),
    );
  }
}
