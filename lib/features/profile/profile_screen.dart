import 'package:flutter/material.dart';

import 'package:portifolio_dev/core/theme/theme_context.dart';
import 'package:portifolio_dev/data/portfolio_data.dart';
import 'package:portifolio_dev/features/profile/widgets/contact_card.dart';
import 'package:portifolio_dev/features/profile/widgets/profile_hero.dart';
import 'package:portifolio_dev/features/profile/widgets/skills_section.dart';
import 'package:portifolio_dev/shared/widgets/scrollable_page.dart';
import 'package:portifolio_dev/shared/widgets/section_header.dart';

/// Tela de perfil: apresentação, sobre, habilidades e contato.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const profile = PortfolioData.profile;

    return ScrollablePage(
      children: [
        const ProfileHero(profile: profile),
        const SectionHeader(title: 'Sobre'),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              profile.about,
              style: context.text.bodyLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
        ),
        const SectionHeader(
          title: 'Habilidades',
          subtitle: 'Tecnologias e ferramentas com as quais trabalho',
        ),
        const SkillsSection(skills: PortfolioData.skills),
        const SectionHeader(title: 'Contato'),
        const ContactCard(profile: profile),
      ],
    );
  }
}
