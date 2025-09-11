import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/core/services/local_storage.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/input/nuber_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class VerifyPhoneCodeScreen extends StatefulWidget {
  const VerifyPhoneCodeScreen({super.key});

  @override
  State<VerifyPhoneCodeScreen> createState() => _VerifyPhoneCodeScreenState();
}

class _VerifyPhoneCodeScreenState extends State<VerifyPhoneCodeScreen> {
  Duration _timerDuration = const Duration(minutes: 1);
  final TextEditingController _codeController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _restartTimer() {
    setState(() {
      _timerDuration = const Duration(minutes: 1);
    });
  }

  Future<void> _showCenterMessage(String message) async {
    if (!mounted) return;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      overlayEntry.remove();
    }
  }

  void _onConfirmPressed() async {
    final code = _codeController.text.trim();

    // Input validation
    if (code.isEmpty || code.length < 4) {
      await _showCenterMessage('4 xonali kodni kiriting');
      return;
    }

    // Loading state
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      await AppLocalStorage.setLoginStatus(true);

      if (mounted) {
        context.go(AppRoutes.home);
      }
    } catch (e) {
      if (mounted) {
        await _showCenterMessage('Xatolik yuz berdi, qaytadan urinib ko\'ring');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildTimer() {
    return TweenAnimationBuilder<Duration>(
      key: ValueKey(_timerDuration.inSeconds),
      duration: _timerDuration,
      tween: Tween(begin: _timerDuration, end: Duration.zero),
      builder: (context, value, child) {
        final seconds = value.inSeconds % 60;
        if (seconds > 0) {
          return AppText(
            text: 'Kod qayta yuborildi ${seconds.toString().padLeft(2, '0')} s',
            color: Colors.grey[600]!,
            size: 16,
          );
        } else {
          return InkWell(
            onTap: _restartTimer,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: AppText(
                text: 'Qayta yuborish',
                color: Theme.of(context).primaryColor,
                size: 16,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const AppText(
          text: 'Parolingizni unutdingizmi?',
          color: Colors.black,
          size: 20,
          font: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppText(
              text: 'Kod +998 77 *** ** 99 raqamiga jo\'natildi',
              color: Colors.black87,
              size: 16,
            ),
            const SizedBox(height: 85),
            NumberInput(
              controller: _codeController,
              // readOnly: _isLoading,
            ),
            const SizedBox(height: 85),
            _buildTimer(),
            const SizedBox(height: 97),
            PrimaryButton(
              label: _isLoading ? 'Tekshirilmoqda...' : 'Tasdiqlash',
              onPressed: _isLoading ? () {} : _onConfirmPressed,
            ),
          ],
        ),
      ),
    );
  }
}
