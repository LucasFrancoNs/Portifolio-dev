import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_colors.dart';
import 'package:portifolio_dev/core/theme/app_dimens.dart';

/// Selo de destaque (ex.: "TOP", "NOVO") exibido sobre os cards.
class HighlightBadge extends StatelessWidget {
  const HighlightBadge({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.highlight,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star_rounded,
              size: 12,
              color: AppColors.onHighlight,
            ),
            const SizedBox(width: 3),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.onHighlight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
