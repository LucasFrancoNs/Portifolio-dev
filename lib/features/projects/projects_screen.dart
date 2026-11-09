import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_colors.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/data/portfolio_data.dart';
import 'package:portifolio_dev/features/projects/widgets/project_card.dart';
import 'package:portifolio_dev/features/projects/widgets/stat_card.dart';
import 'package:portifolio_dev/shared/widgets/responsive_grid.dart';
import 'package:portifolio_dev/shared/widgets/scrollable_page.dart';
import 'package:portifolio_dev/shared/widgets/section_header.dart';

/// Tela de projetos: métricas gerais e projetos em destaque.
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const metrics = PortfolioData.metrics;
    const projects = PortfolioData.projects;

    return ScrollablePage(
      children: [
        Text('Projetos e métricas', style: context.text.headlineMedium),
        const SizedBox(height: 8),
        Text(
          'Um panorama da minha evolução e do que já construí.',
          style: context.text.bodyLarge?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
        const SectionHeader(title: 'Métricas'),
        ResponsiveGrid(
          minItemWidth: 140,
          maxColumns: 3,
          spacing: 12,
          children: [
            for (var i = 0; i < metrics.length; i++)
              StatCard(metric: metrics[i], accent: AppColors.accentAt(i)),
          ],
        ),
        const SectionHeader(title: 'Em destaque'),
        ResponsiveGrid(
          minItemWidth: 440,
          maxColumns: 2,
          children: [
            for (final project in projects) ProjectCard(project: project),
          ],
        ),
      ],
    );
  }
}
