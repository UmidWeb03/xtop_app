import 'package:flutter/material.dart';
import 'package:xtop_app/presentation/atoms/buttons/search_button.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _State();
}

class _State extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SearchButton(
          controller: TextEditingController(),
          onChanged: (value) {},
          readOnly: false,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'uchun natijalar',
                        size: 20,
                        font: FontWeight.bold,
                      ),
                      AppText(
                        text: '0 topildi',
                        size: 15,
                        font: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/search.png',
                        width: 250,
                        height: 244,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 40),
                      AppText(
                        text: 'Topilmadi',
                        size: 25,
                        font: FontWeight.bold,
                      ),
                      const SizedBox(height: 12),
                      AppText(
                        text:
                            'Uzr, siz kiritgan kalit so’z bo’yicha mahsulotlar topilmadi. Boshqa so’z yozishga urinib ko’ring',
                        size: 16,
                        align: TextAlign.center,
                        color: const Color(0xFFB3B3B3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
