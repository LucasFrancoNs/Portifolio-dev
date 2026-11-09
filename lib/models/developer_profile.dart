import 'package:flutter/foundation.dart';

/// Dados pessoais exibidos no cabeçalho e na seção de contato.
@immutable
class DeveloperProfile {
  const DeveloperProfile({
    required this.name,
    required this.role,
    required this.headline,
    required this.about,
    required this.location,
    required this.email,
    required this.githubUser,
  });

  final String name;
  final String role;
  final String headline;
  final String about;
  final String location;
  final String email;
  final String githubUser;

  /// Iniciais (primeira e última palavra do nome), em maiúsculas.
  String get initials {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) {
      return '';
    }
    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  Uri get emailUri => Uri(scheme: 'mailto', path: email);

  Uri get githubUri => Uri.https('github.com', '/$githubUser');

  /// Forma curta para exibição, sem protocolo.
  String get githubLabel => 'github.com/$githubUser';
}
