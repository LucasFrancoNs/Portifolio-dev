import 'package:flutter/material.dart';

/// Chip reutilizável para exibir uma habilidade (skill) no crachá.
class ChipHabilidade extends StatelessWidget {
  final String texto;

  const ChipHabilidade({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(texto),
      backgroundColor: Colors.green,
      labelStyle: const TextStyle(
        color: Colors.indigo,
        fontWeight: FontWeight.w600,
      ),
      side: const BorderSide(color: Colors.indigo, width: 1.5),
    );
  }
}
