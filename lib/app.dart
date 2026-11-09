import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_theme.dart';
import 'package:portifolio_dev/data/portfolio_data.dart';
import 'package:portifolio_dev/features/shell/app_shell.dart';

/// Raiz da aplicação: configura tema (claro/escuro) e a navegação principal.
class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme(Brightness current) {
    setState(() {
      _themeMode =
          current == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.profile.name} | Portfólio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: AppShell(onToggleTheme: _toggleTheme),
    );
  }
}
