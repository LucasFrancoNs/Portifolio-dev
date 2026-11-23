import 'package:flutter/material.dart';

/// Gradientes de marca, expostos via [ThemeExtension] para acompanhar o tema.
///
/// Tudo é derivado do matiz (hue) da cor semente do perfil, então um perfil
/// verde gera gradientes verdes e um perfil vermelho gera gradientes vermelhos.
@immutable
class BrandGradients extends ThemeExtension<BrandGradients> {
  const BrandGradients({required this.hero, required this.onHero});

  factory BrandGradients.fromSeed(Color seed, Brightness brightness) {
    final base = HSLColor.fromColor(seed);

    Color tone(double lightness, [double saturation = 0.65]) {
      return base
          .withSaturation(saturation)
          .withLightness(lightness)
          .toColor();
    }

    final isDark = brightness == Brightness.dark;
    return BrandGradients(
      hero: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? <Color>[tone(0.12), tone(0.24)]
            : <Color>[tone(0.22), tone(0.30)],
      ),
      onHero: tone(0.26, 0.70),
    );
  }

  /// Gradiente do cabeçalho do perfil e da marca.
  final LinearGradient hero;

  /// Cor forte da marca para texto sobre fundo branco (ex.: botão do cabeçalho).
  final Color onHero;

  @override
  BrandGradients copyWith({LinearGradient? hero, Color? onHero}) {
    return BrandGradients(
      hero: hero ?? this.hero,
      onHero: onHero ?? this.onHero,
    );
  }

  @override
  BrandGradients lerp(ThemeExtension<BrandGradients>? other, double t) {
    if (other is! BrandGradients) {
      return this;
    }
    return BrandGradients(
      hero: LinearGradient.lerp(hero, other.hero, t)!,
      onHero: Color.lerp(onHero, other.onHero, t)!,
    );
  }
}
