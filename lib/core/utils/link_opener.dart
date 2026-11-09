import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// Abre links externos e copia textos, sempre avisando o usuário.
abstract final class LinkOpener {
  /// Abre [uri] no app externo. Se não for possível, copia [fallbackCopy]
  /// (ou o próprio link) para a área de transferência.
  static Future<void> open(
    BuildContext context,
    Uri uri, {
    String? fallbackCopy,
  }) async {
    final messenger = ScaffoldMessenger.of(context);

    var opened = false;
    try {
      opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      opened = false;
    }
    if (opened) {
      return;
    }

    await Clipboard.setData(ClipboardData(text: fallbackCopy ?? '$uri'));
    _notify(
      messenger,
      'Não foi possível abrir o link. Ele foi copiado para a área de '
      'transferência.',
    );
  }

  /// Copia [text] para a área de transferência e mostra [message].
  static Future<void> copy(
    BuildContext context,
    String text, {
    String message = 'Copiado!',
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(ClipboardData(text: text));
    _notify(messenger, message);
  }

  static void _notify(ScaffoldMessengerState messenger, String message) {
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
