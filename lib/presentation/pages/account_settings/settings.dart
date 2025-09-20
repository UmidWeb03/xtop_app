import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
        title: const AppText(
          text: 'Hisobni sozlash',
          color: AppColors.darkColor,
          size: 20,
          font: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 882,
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
                // BuildVerticalMenuList(),
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
            AppIcons(
              iconPath: 'assets/icons/users.png',
              width: 140,
              height: 140,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: const AppIcons(
                  iconPath: 'assets/icons/camera.png',
                  iconWidth: 40,
                  iconHeight: 40,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
