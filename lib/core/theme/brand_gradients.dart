import 'package:flutter/material.dart';

/// Gradientes de marca, expostos via [ThemeExtension] para acompanhar o tema.
@immutable
class BrandGradients extends ThemeExtension<BrandGradients> {
  const BrandGradients({required this.hero});

  factory BrandGradients.forBrightness(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return BrandGradients(
      hero: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? const <Color>[Color(0xFF2E1065), Color(0xFF5B21B6)]
            : const <Color>[Color(0xFF6D28D9), Color(0xFF8B5CF6)],
      ),
    );
  }

  /// Gradiente do cabeçalho do perfil e da marca.
  final LinearGradient hero;

  @override
  BrandGradients copyWith({LinearGradient? hero}) {
    return BrandGradients(hero: hero ?? this.hero);
  }

  @override
  BrandGradients lerp(ThemeExtension<BrandGradients>? other, double t) {
    if (other is! BrandGradients) {
      return this;
    }
    return BrandGradients(hero: LinearGradient.lerp(hero, other.hero, t)!);
  }
}
