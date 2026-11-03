import 'package:flutter/material.dart';
import 'widgets/tela_perfil.dart';
import 'widgets/tela_dashboard.dart';

void main() => runApp(const DevFolioApp());

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio',
      debugShowCheckedModeBanner: false,
      // Tema global (ThemeData) - ajustado na semana 3
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        cardTheme: const CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: const Navegacao(),
    );
  }
}

class Navegacao extends StatefulWidget {
  const Navegacao({super.key});

  @override
  State<Navegacao> createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  int _indice = 0;

  final List<Widget> _telas = const [TelaPerfil(), TelaDashboard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _indice, children: _telas),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.badge), label: 'Perfil'),
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Projetos'),
        ],
      ),
    );
  }
}
