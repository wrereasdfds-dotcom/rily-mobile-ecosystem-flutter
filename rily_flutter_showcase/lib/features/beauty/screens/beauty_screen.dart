import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/loading_view.dart';
import '../../reservations/providers/reservation_provider.dart';
import '../models/salon.dart';
import '../providers/beauty_provider.dart';

class BeautyScreen extends StatefulWidget {
  const BeautyScreen({super.key});

  @override
  State<BeautyScreen> createState() => _BeautyScreenState();
}

class _BeautyScreenState extends State<BeautyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BeautyProvider>().loadSalons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BeautyProvider>();

    if (provider.isLoading) {
      return const LoadingView(message: 'Loading beauty partners...');
    }

    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage!));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: provider.salons.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final salon = provider.salons[index];
        return _SalonCard(salon: salon);
      },
    );
  }
}

class _SalonCard extends StatelessWidget {
  const _SalonCard({required this.salon});

  final Salon salon;

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
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: const Icon(Icons.spa_outlined),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(salon.name, style: Theme.of(context).textTheme.titleMedium),
                      Text('${salon.city} • ${salon.rating} ★'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: salon.services
                  .map((service) => Chip(label: Text(service)))
                  .toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: Text(salon.imageLabel)),
                FilledButton.icon(
                  onPressed: () async {
                    final reservationProvider = context.read<ReservationProvider>();
                    await reservationProvider.createReservation(
                      type: 'beauty',
                      targetId: salon.id,
                      title: salon.name,
                      date: DateTime.now().add(const Duration(days: 1)),
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking confirmed for ${salon.name}')),
                      );
                    }
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                  label: const Text('Book'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
