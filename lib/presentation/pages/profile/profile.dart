import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/data/repositories/prfile_data.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/sections/profile_settings.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
        title: const AppText(
          text: 'Profile',
          color: AppColors.darkColor,
          size: 20,
          font: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.infinity,
        // height: 882,
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BuildProfileHeader(),
                const SizedBox(height: 14),
                Divider(
                  thickness: 1,
                  color: AppColors.searchColor.withOpacity(0.3),
                ),
                const SizedBox(height: 14),
                BuildVerticalMenuList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildProfileHeader extends StatelessWidget {
  const BuildProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const AppIcons(
              iconPath: 'assets/images/users.png',
              width: 120,
              height: 120,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: const AppIcons(
                  iconPath: 'assets/icons/edit.png',
                  iconWidth: 30,
                  iconHeight: 30,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
        const AppText(
          text: 'Hasanboy',
          color: AppColors.darkColor,
          size: 20,
          font: FontWeight.bold,
        ),
        const AppText(
          text: '+998 99 999 99 99',
          color: AppColors.darkColor,
          size: 12,
        ),
      ],
    );
  }
}

class BuildVerticalMenuList extends StatelessWidget {
  const BuildVerticalMenuList({super.key});
  static final profileItems = ProfileData.profileItems;
  @override
  Widget build(BuildContext context) {
    final verticalItems = profileItems(context);
    return Column(
      children: verticalItems.map(
        (item) {
          return ProfileSettings(
            onTap: item.onTap,
            name: item.name,
            nameColor: item.nameColor,
            primaryIcon: item.primaryIcon,
            secondaryIcon: item.secondaryIcon,
            secondaryname: item.secondaryname,
          );
        },
      ).toList(),
    );
  }
}
