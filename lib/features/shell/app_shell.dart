import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/responsive/breakpoints.dart';
import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/data/portfolio_data.dart';
import 'package:portifolio_dev/features/profile/profile_screen.dart';
import 'package:portifolio_dev/features/projects/projects_screen.dart';
import 'package:portifolio_dev/shared/widgets/brand_mark.dart';

class _ShellDestination {
  const _ShellDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

/// Estrutura de navegação adaptativa: barra inferior em telas estreitas e
/// navegação lateral (rail) em telas largas.
class AppShell extends StatefulWidget {
  const AppShell({required this.onToggleTheme, super.key});

  /// Recebe o brilho atual do tema e alterna para o oposto.
  final ValueChanged<Brightness> onToggleTheme;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const List<_ShellDestination> _destinations = <_ShellDestination>[
    _ShellDestination(
      label: 'Perfil',
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
    ),
    _ShellDestination(
      label: 'Projetos',
      icon: Icons.grid_view_outlined,
      selectedIcon: Icons.grid_view_rounded,
    ),
  ];

  static const List<Widget> _pages = <Widget>[
    ProfileScreen(),
    ProjectsScreen(),
  ];

  int _index = 0;

  void _select(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= Breakpoints.expanded;
    final brightness = context.theme.brightness;
    final isDark = brightness == Brightness.dark;

    final appBar = AppBar(
      titleSpacing: AppSpacing.md,
      title: Row(
        children: [
          BrandMark(initials: PortfolioData.profile.initials, size: 36),
          const SizedBox(width: AppSpacing.md - 4),
          Flexible(
            child: Text(
              PortfolioData.profile.name,
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
          onPressed: () => widget.onToggleTheme(brightness),
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
      ],
    );

    final body = IndexedStack(index: _index, children: _pages);

    if (isWide) {
      return Scaffold(
        appBar: appBar,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationRail(
              selectedIndex: _index,
              onDestinationSelected: _select,
              destinations: [
                for (final d in _destinations)
                  NavigationRailDestination(
                    icon: Icon(d.icon),
                    selectedIcon: Icon(d.selectedIcon),
                    label: Text(d.label),
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
        selectedIndex: _index,
        onDestinationSelected: _select,
        destinations: [
          for (final d in _destinations)
            NavigationDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon),
              label: d.label,
            ),
        ],
      ),
    );
  }
}
