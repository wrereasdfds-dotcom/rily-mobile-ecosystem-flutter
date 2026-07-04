import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/network/mock_api_client.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/beauty/providers/beauty_provider.dart';
import 'features/home/screens/home_screen.dart';
import 'features/parking/providers/parking_provider.dart';
import 'features/reservations/providers/reservation_provider.dart';

void main() {
  final apiClient = MockApiClient();

  runApp(RiLyShowcaseApp(apiClient: apiClient));
}

class RiLyShowcaseApp extends StatelessWidget {
  const RiLyShowcaseApp({super.key, required this.apiClient});

  final MockApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(apiClient)),
        ChangeNotifierProvider(create: (_) => BeautyProvider(apiClient)),
        ChangeNotifierProvider(create: (_) => ParkingProvider(apiClient)),
        ChangeNotifierProvider(create: (_) => ReservationProvider(apiClient)),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'RiLy Mobile Ecosystem',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            home: auth.isAuthenticated ? const HomeScreen() : const LoginScreen(),
          );
        },
      ),
    );
  }
}
