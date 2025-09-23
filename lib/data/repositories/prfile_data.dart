import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_strings.dart';
import 'package:xtop_app/data/models/profil_name.dart';
import 'package:xtop_app/presentation/pages/auth/auth_screen.dart';

class ProfileData {
  static const String secondaryIcon = 'assets/icons/profile/line_right.png';
  static final List<String> names = Settings.settings_name;
  static List<ProfileItem> profileItems(BuildContext context) {
    return [
      ProfileItem(
        id: 1,
        name: names[0],
        primaryIcon: 'assets/icons/profile/users.png',
        secondaryIcon: secondaryIcon,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AuthScreen()),
        ),
      ),
      ProfileItem(
        id: 2,
        name: names[1],
        primaryIcon: 'assets/icons/profile/location.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 3,
        name: names[2],
        primaryIcon: 'assets/icons/profile/notification.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 4,
        name: names[3],
        primaryIcon: 'assets/icons/profile/pay.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 5,
        name: names[4],
        primaryIcon: 'assets/icons/profile/safety.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 6,
        name: names[5],
        primaryIcon: 'assets/icons/profile/language.png',
        secondaryIcon: secondaryIcon,
        secondaryname: 'O\'zbekcha',
      ),
      ProfileItem(
        id: 7,
        name: names[6],
        primaryIcon: 'assets/icons/profile/look.png',
        secondaryIcon: '0',
      ),
      ProfileItem(
        id: 8,
        name: names[7],
        primaryIcon: 'assets/icons/profile/orders.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 9,
        name: names[8],
        primaryIcon: 'assets/icons/profile/document.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 10,
        name: names[9],
        primaryIcon: 'assets/icons/profile/lock.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 11,
        name: names[10],
        primaryIcon: 'assets/icons/profile/info.png',
        secondaryIcon: secondaryIcon,
      ),
      ProfileItem(
        id: 12,
        name: names[11],
        primaryIcon: 'assets/icons/profile/logout.png',
        nameColor: Colors.red,
      ),
    ];
  }
}
