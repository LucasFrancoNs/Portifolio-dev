import 'package:flutter/material.dart';

import 'package:portifolio_dev/models/developer_profile.dart';
import 'package:portifolio_dev/models/portfolio_profile.dart';
import 'package:portifolio_dev/models/project.dart';
import 'package:portifolio_dev/models/skill.dart';
import 'package:portifolio_dev/models/stat_metric.dart';

/// Única fonte de conteúdo do portfólio.
///
/// Cada item de [profiles] vira uma aba, com a própria cor de tema. Para
/// atualizar textos, habilidades, métricas ou projetos, edite apenas este
/// arquivo: a interface se adapta sozinha.
abstract final class PortfolioData {
  static const String _repoUrl =
      'https://github.com/LucasFrancoNs/Portifolio-dev';

  /// Perfil 1: tema verde.
  static const PortfolioProfile lucas = PortfolioProfile(
    tabLabel: 'Perfil 1',
    seedColor: Color(0xFF16A34A),
    developer: DeveloperProfile(
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
    ),
    skills: <Skill>[
      Skill('Flutter', SkillCategory.mobile),
      Skill('Dart', SkillCategory.mobile),
      Skill('HTML5', SkillCategory.web),
      Skill('CSS', SkillCategory.web),
      Skill('JavaScript', SkillCategory.web),
      Skill('Bootstrap', SkillCategory.web),
      Skill('PHP', SkillCategory.backend),
      Skill('Git e GitHub', SkillCategory.tools),
    ],
    metrics: <StatMetric>[
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
    ],
    projects: <Project>[
      Project(
        title: 'Portfólio Dev',
        summary:
            'Portfólio em Flutter com dois perfis, tema claro e escuro, '
            'navegação adaptativa para celular e desktop e todo o conteúdo '
            'centralizado em uma única camada de dados.',
        tags: <String>['Flutter', 'Dart', 'Material 3'],
        repoUrl: _repoUrl,
      ),
    ],
  );

  /// Perfil 2: tema vermelho.
  static const PortfolioProfile thiago = PortfolioProfile(
    tabLabel: 'Perfil 2',
    seedColor: Color(0xFFDC2626),
    developer: DeveloperProfile(
      name: 'Thiago Silva Moraes',
      role: 'Desenvolvedor Flutter e Front-end Júnior',
      headline: 'Criando interfaces para mobile e web com Flutter e JavaScript.',
      about:
          'Desenvolvedor em início de carreira, com foco em Flutter e Dart no '
          'mobile e em interfaces web com HTML, CSS e JavaScript. Gosto de '
          'transformar design em telas bem organizadas, reutilizáveis e '
          'responsivas.',
      location: 'Ribeirão Pires, SP',
      email: 'thiagosilvamoraes@yahoo.com.br',
      githubUser: 'Thiago-sm11',
    ),
    skills: <Skill>[
      Skill('Flutter', SkillCategory.mobile),
      Skill('Dart', SkillCategory.mobile),
      Skill('Material Design', SkillCategory.mobile),
      Skill('HTML5', SkillCategory.web),
      Skill('CSS', SkillCategory.web),
      Skill('JavaScript', SkillCategory.web),
      Skill('PHP', SkillCategory.backend),
      Skill('Git e GitHub', SkillCategory.tools),
    ],
    metrics: <StatMetric>[
      StatMetric(
        icon: Icons.folder_open_rounded,
        value: '6',
        label: 'Projetos concluídos',
      ),
      StatMetric(
        icon: Icons.commit_rounded,
        value: '95',
        label: 'Commits no GitHub',
      ),
      StatMetric(
        icon: Icons.code_rounded,
        value: '4',
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
        value: '180h',
        label: 'Horas de estudo',
      ),
      StatMetric(
        icon: Icons.emoji_events_rounded,
        value: '2',
        label: 'Certificados',
        badge: 'TOP',
      ),
    ],
    projects: <Project>[
      Project(
        title: 'Portfólio Dev',
        summary:
            'Projeto em dupla: telas de perfil e métricas em Flutter, com '
            'componentes reutilizáveis, tema Material 3 e layout que se '
            'adapta do celular ao desktop.',
        tags: <String>['Flutter', 'Dart', 'Trabalho em equipe'],
        repoUrl: _repoUrl,
      ),
    ],
  );

  /// Ordem das abas na navegação.
  static const List<PortfolioProfile> profiles = <PortfolioProfile>[
    lucas,
    thiago,
  ];
}
