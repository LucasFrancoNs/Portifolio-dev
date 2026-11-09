import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/core/utils/link_opener.dart';
import 'package:portifolio_dev/models/project.dart';
import 'package:portifolio_dev/shared/widgets/icon_bubble.dart';

/// Card de projeto: título, resumo, tecnologias e link do repositório.
class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final repoUrl = project.repoUrl;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.card),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconBubble(
                  icon: Icons.rocket_launch_rounded,
                  color: context.colors.primary,
                  size: 40,
                ),
                const SizedBox(width: AppSpacing.md - 4),
                Expanded(
                  child: Text(project.title, style: context.text.titleLarge),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md - 2),
            Text(
              project.summary,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [for (final tag in project.tags) _TagPill(label: tag)],
            ),
            if (repoUrl != null) ...[
              const SizedBox(height: AppSpacing.md),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => LinkOpener.open(
                    context,
                    Uri.parse(repoUrl),
                    fallbackCopy: repoUrl,
                  ),
                  icon: const Icon(Icons.open_in_new_rounded, size: 18),
                  label: const Text('Ver código'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadius.sm - 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: context.text.labelMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
