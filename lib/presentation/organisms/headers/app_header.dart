import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/services/screen_navigate_service.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool _isLoading = false;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final isLoggedIn = await NavigationService.isLoggedIn();
    if (mounted) {
      setState(() => _isLoggedIn = isLoggedIn);
    }
  }

  void _handleAuth() async {
    setState(() => _isLoading = true);

    try {
      if (_isLoggedIn) {
        await NavigationService.handleLogout(context);
        setState(() => _isLoggedIn = false);
      } else {
        // Navigate to auth - login holatini boshqa joyda handle qilamiz
        await NavigationService.handleLogout(context); // This navigates to auth
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showUserMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const AppText(
                text: 'Profil',
                size: 16,
                color: AppColors.greyscaleDarkColor,
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const AppText(
                text: 'Sozlamalar',
                size: 16,
                color: AppColors.greyscaleDarkColor,
              ),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const AppText(
                text: 'Chiqish',
                size: 16,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pop(context);
                _handleAuth();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(width: 107, height: 50),
          if (_isLoggedIn) ...[
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Stack(
                    children: [
                      const Icon(Icons.notifications_outlined, size: 24),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _showUserMenu,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child:
                        const Icon(Icons.person, size: 24, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ] else ...[
            PrimaryButton(
              onPressed: _isLoading ? null : _handleAuth,
              isLoading: _isLoading,
              label: 'Kirish',
              width: 79,
              height: 38,
            ),
          ],
        ],
      ),
    );
  }
}
