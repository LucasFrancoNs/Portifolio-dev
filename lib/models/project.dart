import 'package:flutter/foundation.dart';

/// Projeto exibido na lista de destaques.
@immutable
class Project {
  const Project({
    required this.title,
    required this.summary,
    required this.tags,
    this.repoUrl,
  });

  final String title;
  final String summary;
  final List<String> tags;

  /// Link do repositório. Quando nulo, o botão de código não é exibido.
  final String? repoUrl;
}
