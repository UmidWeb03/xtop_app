import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/ui/screens/home/widgets/search_action_bottom.dart';
import 'package:xtop_app/ui/widgets/App_button.dart';
import 'package:xtop_app/core/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              const _HomeBackgroundSection(),
              CustomScrollView(
                slivers: [
                  _HomeHeaderSection(),
                  const _HomeBodySection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeBackgroundSection extends StatelessWidget {
  const _HomeBackgroundSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/x_background.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _HomeHeaderSection extends StatelessWidget {
  const _HomeHeaderSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _HomeLogoSection(),
            _HomeLogoButtomSection(),
          ],
        ),
      ),
    );
  }
}

class _HomeLogoSection extends StatelessWidget {
  const _HomeLogoSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/x_logo.png',
      width: 107,
      height: 50,
      fit: BoxFit.cover,
    );
  }
}

class _HomeLogoButtomSection extends StatelessWidget {
  const _HomeLogoButtomSection();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () => _handleLoginPressed(context),
      text: 'krish',
      width: 79,
      height: 38,
      backgroundColor: AppColors.accentColor,
      textColor: AppColors.secondaryColor,
    );
  }

  void _handleLoginPressed(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
  }
}

class _HomeBodySection extends StatelessWidget {
  const _HomeBodySection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HomeSearchSection(),
            _HomeTextSection(text: 'Maxsus takliflar', size: 20),
            _HomeBannerSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _HomeTextSection(text: 'Eng mashhurlari', size: 20),
                _HomeTextSection(text: 'Barchasi', size: 15),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _HomeSearchSection extends StatelessWidget {
  const _HomeSearchSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Mahsulot qidirish...',
          hintStyle: TextStyle(
            color: AppColors.greyscaleColor,
            fontSize: 16,
          ),
          prefixIcon: _bodySearchIcon(),
          suffixIcon: _buildSearchActions(),
          filled: true,
          fillColor: AppColors.searchColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // bir xil radius
            borderSide: BorderSide(
              color: AppColors.greyscaleColor, // bir xil rang
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodySearchIcon() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Image.asset(
        'assets/icons/search.png',
        width: 20,
        height: 20,
      ),
    );
  }

  Widget _buildSearchActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchActionButton(
          iconPath: 'assets/icons/voice.png',
          onTap: () {},
        ),
        SearchActionButton(
          iconPath: 'assets/icons/filter.png',
          onTap: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _HomeTextSection extends StatelessWidget {
  final String text;
  final double size;

  const _HomeTextSection({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.greyscaleDarkColor,
              fontSize: size,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeBannerSection extends StatelessWidget {
  const _HomeBannerSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 181,
      child: Image.asset(
        'assets/images/home_banner.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
