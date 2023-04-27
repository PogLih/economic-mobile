import 'dart:io';

class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.userAgent = 'Custom User Agent';
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  }
}