import 'package:flutter/material.dart';
import 'bloco_estatistica.dart';

/// Tela 02 - Dashboard de Projetos & Métricas.
class TelaDashboard extends StatelessWidget {
  const TelaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard de Projetos')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsivo: 3 colunas em telas largas, 2 em telas estreitas
          final colunas = constraints.maxWidth > 700 ? 3 : 2;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  'Minhas métricas',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              // Expanded dá ao GridView altura limitada -> sem overflow
              Expanded(
                child: GridView.count(
                  crossAxisCount: colunas,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                  children: const [
                    BlocoEstatistica(
                      icone: Icons.folder_open,
                      valor: '8',
                      titulo: 'Projetos concluídos',
                      cor: Colors.indigo,
                      selo: 'TOP',
                    ),
                    BlocoEstatistica(
                      icone: Icons.commit,
                      valor: '120',
                      titulo: 'Commits no GitHub',
                      cor: Colors.teal,
                    ),
                    BlocoEstatistica(
                      icone: Icons.code,
                      valor: '5',
                      titulo: 'Linguagens',
                      cor: Colors.deepOrange,
                    ),
                    BlocoEstatistica(
                      icone: Icons.groups,
                      valor: '3',
                      titulo: 'Projetos em grupo',
                      cor: Colors.purple,
                      selo: 'NOVO',
                    ),
                    BlocoEstatistica(
                      icone: Icons.schedule,
                      valor: '200h',
                      titulo: 'Horas de estudo',
                      cor: Colors.blueGrey,
                    ),
                    BlocoEstatistica(
                      icone: Icons.emoji_events,
                      valor: '2',
                      titulo: 'Certificados',
                      cor: Colors.amber,
                      selo: 'TOP',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
