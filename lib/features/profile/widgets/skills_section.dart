import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/models/skill.dart';
import 'package:portifolio_dev/shared/widgets/icon_bubble.dart';
import 'package:portifolio_dev/shared/widgets/responsive_grid.dart';
import 'package:portifolio_dev/shared/widgets/skill_chip.dart';

/// Habilidades agrupadas por categoria, em cards lado a lado.
class SkillsSection extends StatelessWidget {
  const SkillsSection({required this.skills, super.key});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    final grouped = <SkillCategory, List<Skill>>{
      for (final category in SkillCategory.values)
        category: [
          for (final skill in skills)
            if (skill.category == category) skill,
        ],
    }..removeWhere((_, items) => items.isEmpty);

    return ResponsiveGrid(
      minItemWidth: 300,
      maxColumns: 2,
      children: [
        for (final entry in grouped.entries)
          _SkillGroupCard(category: entry.key, skills: entry.value),
      ],
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  const _SkillGroupCard({required this.category, required this.skills});

  final SkillCategory category;
  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
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
                  icon: category.icon,
                  color: context.colors.primary,
                  size: 40,
                ),
                const SizedBox(width: AppSpacing.md - 4),
                Text(category.label, style: context.text.titleMedium),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final skill in skills) SkillChip(label: skill.name),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
