import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_theme.dart';
import 'package:portifolio_dev/data/portfolio_data.dart';
import 'package:portifolio_dev/features/shell/app_shell.dart';

/// Raiz da aplicação: guarda a aba ativa e o modo claro/escuro.
///
/// O tema depende da aba ativa, então ao trocar de perfil toda a interface
/// muda de cor (verde no Perfil 1, vermelho no Perfil 2) com transição suave.
class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  int _profileIndex = 0;

  void _selectProfile(int index) => setState(() => _profileIndex = index);

  void _toggleTheme(Brightness current) {
    setState(() {
      _themeMode =
          current == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final seed = PortfolioData.profiles[_profileIndex].seedColor;

    return MaterialApp(
      title: 'Portfólio Dev',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.resolve(seed, Brightness.light),
      darkTheme: AppTheme.resolve(seed, Brightness.dark),
      themeMode: _themeMode,
      home: AppShell(
        profiles: PortfolioData.profiles,
        selectedIndex: _profileIndex,
        onSelected: _selectProfile,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
