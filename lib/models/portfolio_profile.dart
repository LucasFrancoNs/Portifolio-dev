import 'package:flutter/material.dart';

import 'package:portifolio_dev/models/developer_profile.dart';
import 'package:portifolio_dev/models/project.dart';
import 'package:portifolio_dev/models/skill.dart';
import 'package:portifolio_dev/models/stat_metric.dart';

/// Tudo o que compõe uma aba do portfólio: pessoa, conteúdo e cor do tema.
@immutable
class PortfolioProfile {
  const PortfolioProfile({
    required this.tabLabel,
    required this.seedColor,
    required this.developer,
    required this.skills,
    required this.metrics,
    required this.projects,
  });

  /// Texto da aba na navegação (ex.: "Perfil 1").
  final String tabLabel;

  /// Cor semente do tema deste perfil. Todo o visual é derivado dela.
  final Color seedColor;

  final DeveloperProfile developer;
  final List<Skill> skills;
  final List<StatMetric> metrics;
  final List<Project> projects;
}
