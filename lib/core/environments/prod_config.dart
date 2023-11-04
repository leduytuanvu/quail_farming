import 'config.dart';

class ProdConfig implements Config {
  @override
  String get apiBaseUrl => 'https://stag-api.example.com';

  @override
  String get apiKey => 'your-stag-api-key-here';

  @override
  int get connectTimeout => 7000;

  @override
  int get receiveTimeout => 4000;
}
