import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/features/profile/widgets/contact_card.dart';
import 'package:portifolio_dev/features/profile/widgets/profile_hero.dart';
import 'package:portifolio_dev/features/profile/widgets/project_card.dart';
import 'package:portifolio_dev/features/profile/widgets/skills_section.dart';
import 'package:portifolio_dev/features/profile/widgets/stat_card.dart';
import 'package:portifolio_dev/models/portfolio_profile.dart';
import 'package:portifolio_dev/shared/widgets/responsive_grid.dart';
import 'package:portifolio_dev/shared/widgets/scrollable_page.dart';
import 'package:portifolio_dev/shared/widgets/section_header.dart';

/// Página completa de um perfil: apresentação, sobre, habilidades, métricas,
/// projetos e contato. As cores vêm do tema ativo, definido pelo perfil.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.profile, super.key});

  final PortfolioProfile profile;

  @override
  Widget build(BuildContext context) {
    final developer = profile.developer;

    return ScrollablePage(
      children: [
        ProfileHero(profile: developer),
        const SectionHeader(title: 'Sobre'),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              developer.about,
              style: context.text.bodyLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
        ),
        const SectionHeader(
          title: 'Habilidades',
          subtitle: 'Tecnologias e ferramentas com as quais trabalho',
        ),
        SkillsSection(skills: profile.skills),
        const SectionHeader(title: 'Métricas'),
        ResponsiveGrid(
          minItemWidth: 140,
          maxColumns: 3,
          spacing: 12,
          children: [
            for (final metric in profile.metrics)
              StatCard(metric: metric, accent: context.colors.primary),
          ],
        ),
        if (profile.projects.isNotEmpty) ...[
          const SectionHeader(title: 'Projetos'),
          ResponsiveGrid(
            minItemWidth: 440,
            maxColumns: 2,
            children: [
              for (final project in profile.projects)
                ProjectCard(project: project),
            ],
          ),
        ],
        const SectionHeader(title: 'Contato'),
        ContactCard(profile: developer),
      ],
    );
  }
}
