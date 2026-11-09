import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_colors.dart';

/// Avatar circular com anel translúcido e iniciais.
///
/// Para usar uma foto, adicione o arquivo em `assets/`, declare-o no
/// `pubspec.yaml` e troque o conteúdo do disco interno por uma `Image.asset`.
class GradientAvatar extends StatelessWidget {
  const GradientAvatar({required this.initials, this.size = 120, super.key});

  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Avatar com as iniciais $initials',
      child: ExcludeSemantics(
        child: Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(size * 0.05),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.55),
              width: 2,
            ),
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                initials,
                style: TextStyle(
                  fontSize: size * 0.34,
                  fontWeight: FontWeight.w800,
                  color: AppColors.brand,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
