import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/app_dimens.dart';
import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/core/utils/link_opener.dart';
import 'package:portifolio_dev/models/developer_profile.dart';
import 'package:portifolio_dev/shared/widgets/icon_bubble.dart';

/// Card de contato: e-mail, localização e GitHub.
class ContactCard extends StatelessWidget {
  const ContactCard({required this.profile, super.key});

  final DeveloperProfile profile;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _ContactTile(
            icon: Icons.mail_outline_rounded,
            label: 'E-mail',
            value: profile.email,
            onTap: () => LinkOpener.open(
              context,
              profile.emailUri,
              fallbackCopy: profile.email,
            ),
            onCopy: () => LinkOpener.copy(
              context,
              profile.email,
              message: 'E-mail copiado',
            ),
          ),
          const Divider(),
          _ContactTile(
            icon: Icons.location_on_outlined,
            label: 'Localização',
            value: profile.location,
          ),
          const Divider(),
          _ContactTile(
            icon: Icons.code_rounded,
            label: 'GitHub',
            value: profile.githubLabel,
            onTap: () => LinkOpener.open(
              context,
              profile.githubUri,
              fallbackCopy: profile.githubLabel,
            ),
            onCopy: () => LinkOpener.copy(
              context,
              profile.githubLabel,
              message: 'Link do GitHub copiado',
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    this.onCopy,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {
    final onCopy = this.onCopy;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.card,
          vertical: AppSpacing.md - 4,
        ),
        child: Row(
          children: [
            IconBubble(icon: icon, color: context.colors.primary, size: 44),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.text.labelMedium?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: context.text.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (onCopy != null)
              IconButton(
                tooltip: 'Copiar',
                onPressed: onCopy,
                icon: const Icon(Icons.copy_rounded, size: 20),
              ),
          ],
        ),
      ),
    );
  }
}
