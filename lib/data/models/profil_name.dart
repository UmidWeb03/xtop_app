import 'package:flutter/material.dart';

class ProfileItem {
  final int id;
  final String name;
  final String primaryIcon;
  final String? secondaryIcon;
  final String? secondaryname;
  final Color? nameColor;
  final VoidCallback? onTap;

  const ProfileItem({
    required this.id,
    required this.name,
    required this.primaryIcon,
    this.secondaryIcon,
    this.secondaryname,
    this.nameColor,
    this.onTap,
  });
}
