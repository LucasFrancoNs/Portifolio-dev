import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_colors.dart';
import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/core/utils/link_opener.dart';
import 'package:portifolio_dev/models/developer_profile.dart';
import 'package:portifolio_dev/shared/widgets/gradient_avatar.dart';
import 'package:portifolio_dev/shared/widgets/grid_pattern.dart';

/// Cabeçalho de impacto: gradiente, grade decorativa, avatar e ações.
class ProfileHero extends StatelessWidget {
  const ProfileHero({required this.profile, super.key});

  final DeveloperProfile profile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 560;
        final padding = compact ? AppSpacing.lg : AppSpacing.xl;

        final avatar = GradientAvatar(
          initials: profile.initials,
          size: compact ? 104 : 132,
        );
        final details = _HeroDetails(profile: profile, centered: compact);

        return ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          child: DecoratedBox(
            decoration: BoxDecoration(gradient: context.gradients.hero),
            child: Stack(
              children: [
                const Positioned.fill(child: GridPattern()),
                const Positioned(
                  top: -70,
                  right: -50,
                  child: _Glow(size: 240, color: AppColors.cyan, alpha: 0.30),
                ),
                const Positioned(
                  bottom: -90,
                  left: -60,
                  child: _Glow(size: 220, color: Colors.white, alpha: 0.14),
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: compact
                      ? Column(
                          children: [
                            avatar,
                            const SizedBox(height: AppSpacing.md),
                            details,
                          ],
                        )
                      : Row(
                          children: [
                            avatar,
                            const SizedBox(width: AppSpacing.xl),
                            Expanded(child: details),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HeroDetails extends StatelessWidget {
  const _HeroDetails({required this.profile, required this.centered});

  final DeveloperProfile profile;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final textAlign = centered ? TextAlign.center : TextAlign.start;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        _RolePill(role: profile.role),
        const SizedBox(height: AppSpacing.md - 4),
        Text(
          profile.name,
          textAlign: textAlign,
          style: context.text.displaySmall?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          profile.headline,
          textAlign: textAlign,
          style: context.text.bodyLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.88),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          spacing: AppSpacing.md - 4,
          runSpacing: AppSpacing.md - 4,
          children: [
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.brand,
              ),
              onPressed: () => LinkOpener.open(
                context,
                profile.emailUri,
                fallbackCopy: profile.email,
              ),
              icon: const Icon(Icons.mail_outline_rounded),
              label: const Text('Enviar e-mail'),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.70)),
              ),
              onPressed: () => LinkOpener.open(
                context,
                profile.githubUri,
                fallbackCopy: profile.githubLabel,
              ),
              icon: const Icon(Icons.code_rounded),
              label: const Text('GitHub'),
            ),
          ],
        ),
      ],
    );
  }
}

class _RolePill extends StatelessWidget {
  const _RolePill({required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          role,
          textAlign: TextAlign.center,
          style: context.text.labelLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Brilho radial decorativo.
class _Glow extends StatelessWidget {
  const _Glow({required this.size, required this.color, required this.alpha});

  final double size;
  final Color color;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: alpha),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}
