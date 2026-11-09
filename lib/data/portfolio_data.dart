import 'package:flutter/material.dart';

import 'package:portifolio_dev/models/developer_profile.dart';
import 'package:portifolio_dev/models/project.dart';
import 'package:portifolio_dev/models/skill.dart';
import 'package:portifolio_dev/models/stat_metric.dart';

/// Única fonte de conteúdo do portfólio.
///
/// Para atualizar textos, habilidades, métricas ou projetos, edite apenas
/// este arquivo: a interface se adapta sozinha.
abstract final class PortfolioData {
  static const DeveloperProfile profile = DeveloperProfile(
    name: 'Lucas Novaes',
    role: 'Desenvolvedor Flutter e Back-end Júnior',
    headline: 'Construindo apps e sistemas web com Flutter, Dart e PHP.',
    about:
        'Desenvolvedor em início de carreira, atuando com Flutter e Dart no '
        'mobile e com PHP no back-end. Este portfólio reúne meu perfil, '
        'minhas habilidades e um panorama dos projetos e das métricas da '
        'minha trajetória.',
    location: 'Ribeirão Pires, SP',
    email: 'lucasnovaes479@gmail.com',
    githubUser: 'LucasFrancoNs',
  );

  static const List<Skill> skills = <Skill>[
    Skill('Flutter', SkillCategory.mobile),
    Skill('Dart', SkillCategory.mobile),
    Skill('HTML5', SkillCategory.web),
    Skill('CSS', SkillCategory.web),
    Skill('JavaScript', SkillCategory.web),
    Skill('Bootstrap', SkillCategory.web),
    Skill('PHP', SkillCategory.backend),
    Skill('Git e GitHub', SkillCategory.tools),
  ];

  static const List<StatMetric> metrics = <StatMetric>[
    StatMetric(
      icon: Icons.folder_open_rounded,
      value: '8',
      label: 'Projetos concluídos',
      badge: 'TOP',
    ),
    StatMetric(
      icon: Icons.commit_rounded,
      value: '120',
      label: 'Commits no GitHub',
    ),
    StatMetric(
      icon: Icons.code_rounded,
      value: '5',
      label: 'Linguagens',
    ),
    StatMetric(
      icon: Icons.groups_rounded,
      value: '3',
      label: 'Projetos em grupo',
      badge: 'NOVO',
    ),
    StatMetric(
      icon: Icons.schedule_rounded,
      value: '200h',
      label: 'Horas de estudo',
    ),
    StatMetric(
      icon: Icons.emoji_events_rounded,
      value: '2',
      label: 'Certificados',
      badge: 'TOP',
    ),
  ];

  static const List<Project> projects = <Project>[
    Project(
      title: 'Portfólio Dev',
      summary:
          'Portfólio pessoal em Flutter, com tema claro e escuro, navegação '
          'adaptativa para celular e desktop e todo o conteúdo centralizado '
          'em uma única camada de dados.',
      tags: <String>['Flutter', 'Dart', 'Material 3'],
      repoUrl: 'https://github.com/LucasFrancoNs/Portifolio-dev',
    ),
  ];
}
