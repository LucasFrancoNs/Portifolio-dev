import 'package:flutter/material.dart';
import 'chip_habilidade.dart';

/// Tela 01 - Perfil & Crachá do Desenvolvedor.
class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  // TROQUE pelos seus dados
  static const String nome = 'Seu Nome Completo';
  static const String cargo = 'Desenvolvedor Flutter Júnior';
  static const String email = 'seuemail@exemplo.com';
  static const String cidade = 'São Bernardo do Campo, SP';
  static const String github = 'github.com/USUARIO';
  static const List<String> skills = [
    'Flutter',
    'Dart',
    'PHP',
    'HTML',
    'CSS',
    'JavaScript',
    'Bootstrap',
    'Git',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crachá do Desenvolvedor')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF3F51B5), Color(0xFF7E57C2)],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar com borda (CircleAvatar dentro de CircleAvatar)
                  const CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 57,
                      backgroundColor: Colors.indigo,
                      // Para usar foto: adicione em assets/ e no pubspec.yaml,
                      // depois troque por:
                      // backgroundImage: AssetImage('assets/foto.jpg'),
                      child: Icon(Icons.person, size: 64, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    cargo,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const Divider(height: 32, color: Colors.white54),
                  _linhaInfo(Icons.email, email),
                  _linhaInfo(Icons.location_on, cidade),
                  _linhaInfo(Icons.code, github),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Habilidades',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Wrap quebra a linha sozinho -> sem overflow
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      for (final s in skills) ChipHabilidade(texto: s),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _linhaInfo(IconData icone, String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icone, color: Colors.white, size: 20),
          const SizedBox(width: 12),
          // Expanded evita RenderFlex overflow em textos longos
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
