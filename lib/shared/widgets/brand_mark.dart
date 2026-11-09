import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/theme_context.dart';

/// Logotipo compacto: iniciais sobre o gradiente de marca.
class BrandMark extends StatelessWidget {
  const BrandMark({required this.initials, this.size = 40, super.key});

  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: context.gradients.hero,
        borderRadius: BorderRadius.circular(size * 0.32),
      ),
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.38,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
