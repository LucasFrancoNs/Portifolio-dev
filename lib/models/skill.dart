import 'package:flutter/material.dart';

/// Agrupamento das habilidades na tela de perfil.
enum SkillCategory {
  mobile('Mobile', Icons.phone_android_rounded),
  web('Web', Icons.language_rounded),
  backend('Back-end', Icons.dns_rounded),
  tools('Ferramentas', Icons.build_rounded);

  const SkillCategory(this.label, this.icon);

  final String label;
  final IconData icon;
}

@immutable
class Skill {
  const Skill(this.name, this.category);

  final String name;
  final SkillCategory category;
}
