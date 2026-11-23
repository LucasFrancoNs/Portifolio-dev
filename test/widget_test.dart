import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portifolio_dev/app.dart';
import 'package:portifolio_dev/data/portfolio_data.dart';

void main() {
  final lucas = PortfolioData.profiles[0].developer;
  final thiago = PortfolioData.profiles[1].developer;

  Color primaryColor(WidgetTester tester) {
    final context = tester.element(find.byType(Scaffold).first);
    return Theme.of(context).colorScheme.primary;
  }

  Finder navigationItem(String label) {
    return find.descendant(
      of: find.byType(NavigationBar),
      matching: find.text(label),
    );
  }

  testWidgets('inicia no Perfil 1, com tema verde', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text(lucas.name), findsWidgets);
    expect(find.text(thiago.name), findsNothing);
    expect(find.text('Habilidades'), findsOneWidget);

    final hue = HSLColor.fromColor(primaryColor(tester)).hue;
    expect(hue, inInclusiveRange(90, 180));
  });

  testWidgets('o Perfil 2 mostra o Thiago e muda o tema para vermelho',
      (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(navigationItem('Perfil 2'));
    await tester.pumpAndSettle();

    expect(find.text(thiago.name), findsWidgets);
    expect(find.text(lucas.name), findsNothing);

    final hue = HSLColor.fromColor(primaryColor(tester)).hue;
    expect(hue < 25 || hue > 335, isTrue);
  });

  testWidgets('voltar ao Perfil 1 restaura o tema verde', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(navigationItem('Perfil 2'));
    await tester.pumpAndSettle();
    await tester.tap(navigationItem('Perfil 1'));
    await tester.pumpAndSettle();

    expect(find.text(lucas.name), findsWidgets);
    final hue = HSLColor.fromColor(primaryColor(tester)).hue;
    expect(hue, inInclusiveRange(90, 180));
  });

  testWidgets('alterna entre tema escuro e claro', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    // O app inicia no tema escuro.
    await tester.tap(find.byTooltip('Usar tema claro'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Usar tema escuro'), findsOneWidget);
  });
}
