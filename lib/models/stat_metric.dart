import 'package:flutter/widgets.dart';

/// Métrica exibida nos cards do painel de projetos.
@immutable
class StatMetric {
  const StatMetric({
    required this.icon,
    required this.value,
    required this.label,
    this.badge,
  });

  final IconData icon;
  final String value;
  final String label;

  /// Texto do selo de destaque. Quando nulo, nenhum selo é exibido.
  final String? badge;
}
