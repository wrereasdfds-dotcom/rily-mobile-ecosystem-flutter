class AppConstants {
  static const appName = 'RiLy Mobile Ecosystem';
  static const demoEmail = 'achraf.demo@rily.app';
  static const demoPassword = 'demo1234';

  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'mock://local',
  );
}
