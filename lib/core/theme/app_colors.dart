import 'package:flutter/painting.dart';

/// Paleta de marca. Roxo como cor principal e ciano como acento.
abstract final class AppColors {
  /// Semente usada para gerar o [ColorScheme] (claro e escuro).
  static const Color seed = Color(0xFF7C3AED);

  /// Roxo de marca, usado sobre fundos brancos (ex.: iniciais do avatar).
  static const Color brand = Color(0xFF6D28D9);

  /// Ciano de acento.
  static const Color cyan = Color(0xFF22D3EE);

  /// Cores do selo de destaque.
  static const Color highlight = Color(0xFFFFC857);
  static const Color onHighlight = Color(0xFF3B2A00);

  /// Acentos usados nos cards de métricas.
  static const List<Color> accents = <Color>[
    Color(0xFF8B5CF6), // violeta
    Color(0xFF06B6D4), // ciano
    Color(0xFFF97316), // laranja
    Color(0xFFEC4899), // rosa
    Color(0xFF3B82F6), // azul
    Color(0xFFEAB308), // âmbar
  ];

  static Color accentAt(int index) => accents[index % accents.length];
}
