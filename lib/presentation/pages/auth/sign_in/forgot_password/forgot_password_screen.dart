import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/buttons/icon_button.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/pages/auth/sign_in/sign_in_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int? _selectedIndex;

  void _selectIndex(int index) {
    setState(() {
      // Agar bir xil index bosilsa, tanlovni bekor qilish
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }

  void _showCenterMessage(String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.5,
        left: 40,
        right: 40,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // 2 soniyadan keyin olib tashlash
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  void _handleContinue() {
    if (_selectedIndex == null) {
      _showCenterMessage('Tiklash usulini tanlang');
      return;
    }
    if (_selectedIndex == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
        title: const AppText(
          text: 'Parolingizni untdingizmi',
          color: Colors.black,
          size: 20,
          font: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/password.png',
                width: 276,
                height: 250,
              ),
              const SizedBox(height: 33),
              const AppText(
                text:
                    'Hisobingizni tiklash uchun qaysi aloqa ma’lumotlaridan foydalanishni tanlang',
                color: Colors.black,
                size: 15,
              ),
              const SizedBox(height: 24),
              IconButtons(
                img: 'assets/images/sms.png',
                topText: 'SMS orqali',
                bottomText: '+998 77 *** ** 99',
                isSelected: _selectedIndex == 0,
                onTap: () => _selectIndex(0),
              ),
              const SizedBox(height: 24),
              IconButtons(
                img: 'assets/images/mail.png',
                topText: 'Email orqali',
                bottomText: 'example@mail.com',
                isSelected: _selectedIndex == 1,
                onTap: () => _selectIndex(1),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Davom etish',
                onPressed: _handleContinue,
                backgroundColor: _selectedIndex != null
                    ? AppColors.primaryColor
                    : Colors.grey.shade300,
                textColor: _selectedIndex != null
                    ? Colors.white
                    : Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
