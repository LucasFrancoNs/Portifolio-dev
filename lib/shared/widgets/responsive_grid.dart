import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_dimens.dart';

/// Grade responsiva: calcula o número de colunas pela largura disponível e
/// iguala a altura dos itens de cada linha.
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    required this.children,
    this.minItemWidth = 300,
    this.maxColumns = 4,
    this.spacing = AppSpacing.md,
    super.key,
  });

  final List<Widget> children;
  final double minItemWidth;
  final int maxColumns;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fit =
            ((constraints.maxWidth + spacing) / (minItemWidth + spacing))
                .floor();
        final columns = math.max(1, math.min(fit, maxColumns));

        final rows = <Widget>[];
        for (var start = 0; start < children.length; start += columns) {
          final slice = children.sublist(
            start,
            math.min(start + columns, children.length),
          );

          rows.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < columns; i++) ...[
                    if (i > 0) SizedBox(width: spacing),
                    Expanded(
                      child: i < slice.length
                          ? slice[i]
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < rows.length; i++) ...[
              if (i > 0) SizedBox(height: spacing),
              rows[i],
            ],
          ],
        );
      },
    );
  }
}
