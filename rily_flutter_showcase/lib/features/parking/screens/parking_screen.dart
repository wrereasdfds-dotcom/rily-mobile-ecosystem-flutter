import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/loading_view.dart';
import '../../reservations/providers/reservation_provider.dart';
import '../models/parking_location.dart';
import '../providers/parking_provider.dart';

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ParkingProvider>().loadParkings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ParkingProvider>();

    if (provider.isLoading) {
      return const LoadingView(message: 'Loading parking locations...');
    }

    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage!));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: provider.parkings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final parking = provider.parkings[index];
        return _ParkingCard(parking: parking);
      },
    );
  }
}

class _ParkingCard extends StatelessWidget {
  const _ParkingCard({required this.parking});

  final ParkingLocation parking;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: const Icon(Icons.local_parking_outlined),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(parking.name, style: Theme.of(context).textTheme.titleMedium),
                      Text(parking.city),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('${parking.availableSlots} slots available'),
            Text('${parking.pricePerHour.toStringAsFixed(0)} MAD / hour'),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: parking.availableSlots == 0
                    ? null
                    : () async {
                        final reservationProvider = context.read<ReservationProvider>();
                        await reservationProvider.createReservation(
                          type: 'parking',
                          targetId: parking.id,
                          title: parking.name,
                          date: DateTime.now().add(const Duration(hours: 2)),
                        );

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Parking reserved at ${parking.name}')),
                          );
                        }
                      },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Reserve'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
