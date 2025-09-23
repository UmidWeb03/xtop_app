import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/pages/profile/profile.dart';

class AppHeader extends StatelessWidget {
  final bool isLoggedIn;

  const AppHeader({
    super.key,
    this.isLoggedIn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: isLoggedIn ? 0 : 24,
      ),
      child: isLoggedIn
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.greyColor.withOpacity(0.1),
                          child: const AppLogo(
                            width: 48,
                            height: 48,
                            img: 'assets/images/users.png',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Hayrli kun 👋',
                            size: 14,
                            // color: AppColors.greyColor,
                          ),
                          AppText(
                            text: 'Hasanboy',
                            size: 20,
                            font: FontWeight.bold,
                            color: AppColors.darkColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Stack(
                        children: [
                          Image.asset(
                            'assets/icons/notification.png',
                            width: 28,
                            height: 28,
                          ),
                          const Positioned(
                            right: 0,
                            top: 0,
                            child: SizedBox(
                              width: 8,
                              height: 8,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/like.png',
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ],
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLogo(width: 107, height: 50),
                PrimaryButton(
                  onPressed: () {},
                  // isLoading: isLoggedIn,
                  label: 'Kirish',
                  width: 0,
                  height: 38,
                ),
              ],
            ),
    );
  }
}
