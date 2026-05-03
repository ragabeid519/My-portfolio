// lib/utils/email_launcher.dart
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

void openEmailClient(String email, String subject, String body) {
  final mailtoUrl =
      'mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

  // ✅ استخدام JavaScript مباشرة عشان نفتح الـ email client
  js.context.callMethod('open', [mailtoUrl, '_self']);
}
