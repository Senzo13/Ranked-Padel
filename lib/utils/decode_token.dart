import 'dart:convert';

Map<String, dynamic>? decodeJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    return null; // Le token JWT doit contenir trois parties (header, payload, signature)
  }

  final payloadBase64Url = parts[1];
  final String padding = '=' * (4 - (payloadBase64Url.length % 4));
  final String normalized =
      payloadBase64Url.replaceAll('-', '+').replaceAll('_', '/') + padding;

  final payloadJson = utf8.decode(base64Url.decode(normalized));

  try {
    final payload = json.decode(payloadJson) as Map<String, dynamic>;
    return payload;
  } catch (e) {
    return null; // Échec du décodage JSON, le token n'est pas valide
  }
}
