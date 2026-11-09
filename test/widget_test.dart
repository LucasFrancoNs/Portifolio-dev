import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portifolio_dev/app.dart';
import 'package:portifolio_dev/data/portfolio_data.dart';

void main() {
  testWidgets('exibe o perfil e navega para projetos', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text(PortfolioData.profile.name), findsWidgets);
    expect(find.text('Habilidades'), findsOneWidget);

    await tester.tap(
      find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text('Projetos'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Métricas'), findsOneWidget);
    expect(find.text('Portfólio Dev'), findsOneWidget);
  });

  testWidgets('alterna entre tema escuro e claro', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    // O app inicia no tema escuro.
    await tester.tap(find.byTooltip('Usar tema claro'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Usar tema escuro'), findsOneWidget);
  });
}
