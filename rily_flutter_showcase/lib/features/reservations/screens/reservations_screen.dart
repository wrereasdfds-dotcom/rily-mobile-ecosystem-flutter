import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/empty_state.dart';
import '../models/reservation.dart';
import '../providers/reservation_provider.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservations = context.watch<ReservationProvider>().reservations;

    if (reservations.isEmpty) {
      return const EmptyState(
        title: 'No reservations yet',
        message: 'Book a beauty service or reserve a parking slot to see it here.',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: reservations.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final reservation = reservations[index];
        return Card(
          child: ListTile(
            leading: Icon(
              reservation.type == 'beauty' ? Icons.spa_outlined : Icons.local_parking_outlined,
            ),
            title: Text(reservation.title),
            subtitle: Text(DateFormat('EEE, d MMM • HH:mm').format(reservation.date)),
            trailing: _StatusChip(status: reservation.status),
          ),
        );
      },
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final ReservationStatus status;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(status.name));
  }
}
