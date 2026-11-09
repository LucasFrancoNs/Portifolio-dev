import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/responsive/breakpoints.dart';
import 'package:portifolio_dev/core/theme/app_dimens.dart';

/// Página rolável com conteúdo centralizado e largura máxima.
///
/// Cada página tem o próprio [ScrollController], o que permite manter várias
/// páginas vivas dentro de um `IndexedStack` sem conflito de rolagem.
class ScrollablePage extends StatefulWidget {
  const ScrollablePage({required this.children, super.key});

  final List<Widget> children;

  @override
  State<ScrollablePage> createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final gutter =
        width >= Breakpoints.expanded ? AppSpacing.xl : AppSpacing.md;

    return SingleChildScrollView(
      controller: _controller,
      padding: EdgeInsets.fromLTRB(
        gutter,
        AppSpacing.md,
        gutter,
        AppSpacing.xxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.contentMaxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}
