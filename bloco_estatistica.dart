import 'package:flutter/material.dart';
import 'selo_destaque.dart';

/// Bloco de estatística: Card com elevação e selo opcional sobreposto.
class BlocoEstatistica extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String titulo;
  final Color cor;
  final String? selo; // se informado, mostra o selo sobreposto

  const BlocoEstatistica({
    super.key,
    required this.icone,
    required this.valor,
    required this.titulo,
    required this.cor,
    this.selo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icone, size: 32, color: cor),
                  const SizedBox(height: 6),
                  // FittedBox evita overflow em valores maiores
                  FittedBox(
                    child: Text(
                      valor,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: cor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    titulo,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          if (selo != null)
            Positioned(
              top: 8,
              right: 8,
              child: SeloDestaque(texto: selo!),
            ),
        ],
      ),
    );
  }
}
