import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/brand_gradients.dart';

/// Temas Material 3 da aplicação, gerados a partir da cor semente do perfil.
abstract final class AppTheme {
  static final Map<(Color, Brightness), ThemeData> _cache =
      <(Color, Brightness), ThemeData>{};

  /// Tema para a [seed] e o [brightness] informados. O resultado é guardado
  /// em cache, então alternar entre perfis não reconstrói o que já foi criado.
  static ThemeData resolve(Color seed, Brightness brightness) {
    return _cache.putIfAbsent(
      (seed, brightness),
      () => _build(seed, brightness),
    );
  }

  static ThemeData _build(Color seed, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    );

    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: const TextTheme(
        displaySmall: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -1),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        titleLarge: TextStyle(fontWeight: FontWeight.w700, letterSpacing: -0.2),
        titleMedium: TextStyle(fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(height: 1.55),
        bodyMedium: TextStyle(height: 1.5),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 68,
        backgroundColor: scheme.surfaceContainer,
        surfaceTintColor: Colors.transparent,
        indicatorColor: scheme.primaryContainer,
        labelTextStyle: const WidgetStatePropertyAll<TextStyle>(
          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: scheme.surface,
        indicatorColor: scheme.primaryContainer,
        minWidth: 88,
        labelType: NavigationRailLabelType.all,
        selectedLabelTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: scheme.onSurfaceVariant,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: 1,
        thickness: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          shape: buttonShape,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          shape: buttonShape,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[
        BrandGradients.fromSeed(seed, brightness),
      ],
    );
  }
}
