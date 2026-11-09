import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/models/stat_metric.dart';
import 'package:portifolio_dev/shared/widgets/highlight_badge.dart';
import 'package:portifolio_dev/shared/widgets/icon_bubble.dart';

/// Card de métrica: ícone, valor, rótulo e selo opcional sobreposto.
class StatCard extends StatelessWidget {
  const StatCard({required this.metric, required this.accent, super.key});

  final StatMetric metric;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final badge = metric.badge;

    return Card(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.card),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBubble(icon: metric.icon, color: accent),
                const SizedBox(height: AppSpacing.md),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    metric.value,
                    style: context.text.headlineMedium,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  metric.label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (badge != null)
            Positioned(
              top: 14,
              right: 14,
              child: HighlightBadge(label: badge),
            ),
        ],
      ),
    );
  }
}
