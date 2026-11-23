import 'package:flutter/material.dart';

/// Cores fixas, iguais em todos os perfis.
///
/// A cor de marca de cada perfil não fica aqui: ela vem do `seedColor` do
/// próprio perfil e alimenta o tema (veja `AppTheme`).
abstract final class AppColors {
  /// Cores do selo de destaque.
  static const Color highlight = Color(0xFFFFC857);
  static const Color onHighlight = Color(0xFF3B2A00);
}
