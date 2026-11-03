import 'package:flutter/material.dart';

/// Selo pequeno usado sobre os cards (via Stack + Positioned).
class SeloDestaque extends StatelessWidget {
  final String texto;

  const SeloDestaque({super.key, this.texto = 'TOP'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, size: 12, color: Colors.black87),
          const SizedBox(width: 3),
          Text(
            texto,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
