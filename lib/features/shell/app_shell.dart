import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/responsive/breakpoints.dart';
import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/features/profile/profile_screen.dart';
import 'package:portifolio_dev/models/portfolio_profile.dart';
import 'package:portifolio_dev/shared/widgets/brand_mark.dart';

/// Estrutura de navegação adaptativa: barra inferior em telas estreitas e
/// navegação lateral (rail) em telas largas. Cada aba é um perfil.
class AppShell extends StatelessWidget {
  const AppShell({
    required this.profiles,
    required this.selectedIndex,
    required this.onSelected,
    required this.onToggleTheme,
    super.key,
  });

  final List<PortfolioProfile> profiles;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  /// Recebe o brilho atual do tema e alterna para o oposto.
  final ValueChanged<Brightness> onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= Breakpoints.expanded;
    final brightness = context.theme.brightness;
    final isDark = brightness == Brightness.dark;
    final active = profiles[selectedIndex].developer;

    final appBar = AppBar(
      titleSpacing: AppSpacing.md,
      title: Row(
        children: [
          BrandMark(initials: active.initials, size: 36),
          const SizedBox(width: AppSpacing.md - 4),
          Flexible(
            child: Text(
              active.name,
              overflow: TextOverflow.ellipsis,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: isDark ? 'Usar tema claro' : 'Usar tema escuro',
          onPressed: () => onToggleTheme(brightness),
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
      ],
    );

    // As duas páginas ficam vivas no IndexedStack para preservar a rolagem.
    final body = IndexedStack(
      index: selectedIndex,
      children: [
        for (final profile in profiles)
          ProfileScreen(
            key: ValueKey<String>(profile.developer.githubUser),
            profile: profile,
          ),
      ],
    );

    if (isWide) {
      return Scaffold(
        appBar: appBar,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onSelected,
              destinations: [
                for (final profile in profiles)
                  NavigationRailDestination(
                    icon: const Icon(Icons.person_outline_rounded),
                    selectedIcon: const Icon(Icons.person_rounded),
                    label: Text(profile.tabLabel),
                  ),
              ],
            ),
            const VerticalDivider(width: 1, thickness: 1),
            Expanded(child: body),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onSelected,
        destinations: [
          for (final profile in profiles)
            NavigationDestination(
              icon: const Icon(Icons.person_outline_rounded),
              selectedIcon: const Icon(Icons.person_rounded),
              label: profile.tabLabel,
            ),
        ],
      ),
    );
  }
}
