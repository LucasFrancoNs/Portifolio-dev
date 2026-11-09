import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/brand_gradients.dart';

/// Atalhos para ler o tema sem repetir `Theme.of(context)` em todo lugar.
extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get text => Theme.of(this).textTheme;

  BrandGradients get gradients => Theme.of(this).extension<BrandGradients>()!;
}
